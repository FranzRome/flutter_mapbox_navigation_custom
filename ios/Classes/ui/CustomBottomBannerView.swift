//
//  CustomBottomBannerView2.swift
//  flutter_mapbox_navigation
//
//  Created by Francesco Romeo on 01/03/24.
//

import SwiftUI
import Darwin
import Foundation
import UIKit
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections
import SVGView

@available(iOS 13.0, *)
protocol CustomBottomBannerViewDelegate: AnyObject {
    //func customBottomBannerDidCancel(_ banner: CustomBottomBannerView)
}

@available(iOS 15.0, *)
struct CustomBottomBannerView: View {
    
    /*var navigationService: MapboxNavigationService
     
     init(navigationService: MapboxNavigationService){
     self.navigationService = navigationService
     }*/
    
    public init(delegate: CustomBottomBannerViewDelegate? = nil, remainingTime: Float, distance: Float, estimatedArrivalTime: Date, cal: Calendar, controller: CustomBottomBarViewController) {
        self.delegate = delegate
        self.remainingTime = remainingTime
        self.distance = distance
        self.estimatedArrivalTime = estimatedArrivalTime
        self.cal = cal
        self.controller = controller
    }
    
    weak var delegate: CustomBottomBannerViewDelegate?
    public var remainingTime: Float
    public var distance: Float
    public var estimatedArrivalTime: Date
    public var cal: Calendar = Calendar.current
    private var controller: CustomBottomBarViewController
    
    //@State var remainingTime: Float = 0.5
    var body: some View {
        HStack {
            Spacer().frame(width:12).background(.white)
            Button(action: {
                self.onCompleteDelivery()
            }) {
                Image("box")
                    .resizable() // This allows the image to be resized
                    .frame(width: 30, height: 30)
                    .padding(EdgeInsets(top: 9, leading: 24, bottom: 9, trailing: 24))
                    .background(
                        RoundedRectangle(
                            cornerRadius: 10,
                            style: .continuous
                        )
                        .fill(Color(red: 0, green: 0.412, blue: 0.196))
                    )
            }
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .padding(EdgeInsets(top: 9, leading: 24, bottom: 9, trailing: 24))
            .frame(width: 79, height: 48)
            VStack {
                Spacer().frame(height:16).background(.white)
                Text("\(Int(remainingTime/60)) min")
                    .frame(maxWidth: .infinity)
                    .font(Font.title2.weight(.semibold))
                HStack {
                    Image("marker").resizable().scaledToFit().frame(width: 15, height: 15)
                    if distance >= 1000 {
                        Text("\(round<Int>(distance/1000*10)/10)")
                            .font(Font.headline.weight(.semibold))
                           Text("km")
                            .font(Font.headline.weight(.light))
                    } else {
                        Text("\(Int(round(distance)))")
                            .font(Font.headline.weight(.semibold))
                           Text("m")
                            .font(Font.headline.weight(.light))
                        
                    }
                    Spacer().frame(width: 24)
                    Image("clock").resizable().scaledToFit().frame(width: 15, height: 15)
                    if cal.component(.hour, from: estimatedArrivalTime) >= 10 && cal.component(.minute, from: estimatedArrivalTime) >= 10 {
                        Text("\(cal.component(.hour, from:estimatedArrivalTime)):\(cal.component(.minute, from:estimatedArrivalTime))")
                            .font(Font.headline.weight(.semibold))
                    } else if cal.component(.hour, from: estimatedArrivalTime) >= 10 && cal.component(.minute, from: estimatedArrivalTime) < 10 {
                        Text("\(cal.component(.hour, from:estimatedArrivalTime)):0\(cal.component(.minute, from:estimatedArrivalTime))")
                            .font(Font.headline.weight(.semibold))
                    } else if cal.component(.hour, from: estimatedArrivalTime) < 10 && cal.component(.minute, from: estimatedArrivalTime) >= 10 {
                        Text("0\(cal.component(.hour, from:estimatedArrivalTime)):\(cal.component(.minute, from:estimatedArrivalTime))")
                            .font(Font.headline.weight(.semibold))
                    } else {
                        Text("0\(cal.component(.hour, from:estimatedArrivalTime)):0\(cal.component(.minute, from:estimatedArrivalTime))")
                            .font(Font.headline.weight(.semibold))
                    }
                }
                Spacer().frame(height:47).background(.white)
            }
            //.padding(.horizontal, 30)
            
            Button(action: {
                self.onCancel()
            }) {
                Image(systemName: "xmark")
                    .resizable() // This allows the image to be resized
                    .frame(width: 20, height: 20)
                    .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                    .background(
                        RoundedRectangle(
                            cornerRadius: 10,
                            style: .continuous
                        )
                        .stroke(.gray, lineWidth: 2)
                    )
                    .foregroundColor(.black)
            }
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .padding(EdgeInsets(top: 9, leading: 24, bottom: 9, trailing: 24))
            .frame(width: 79, height: 48)
            Spacer().frame(width:12).background(.white)
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.white,ignoresSafeAreaEdges: Edge.Set.bottom)
        
    }
    
    func navigationService(_ service: NavigationService, didUpdate progress: RouteProgress, with location: CLLocation, rawLocation: CLLocation) {
        // Update your controls manually
        print(progress.fractionTraveled)
        //bannerView.rootView.progress = Float(progress.fractionTraveled)
        //bannerView.eta = "~\(Int(round(progress.durationRemaining / 60))) min"
    }
    
    func onCancel() {
        //print("Button Pressed")
        self.controller.onCancel()
    }
    
    func onCompleteDelivery() {
        self.controller.navigationViewController?.completeDelivery()
    }
}

@available(iOS 13.0, *)
struct ProgressBar: View {
    @Binding var progress: Float
    var body: some View {
        if #available(iOS 14.0, *) {
            ProgressView(value: progress, total: 1)
        } else {
            // Fallback on earlier versions
        }
    }
}

@available(iOS 13.0, *)
class HostingView<T: View>: UIView {
    
    private(set) var hostingController: UIHostingController<T>
    
    var rootView: T {
        get { hostingController.rootView }
        set { hostingController.rootView = newValue }
    }
    
    init(rootView: T, frame: CGRect = .zero) {
        hostingController = UIHostingController(rootView: rootView)
        
        super.init(frame: frame)
        
        backgroundColor = .clear
        hostingController.view.backgroundColor = backgroundColor
        hostingController.view.frame = self.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(hostingController.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
