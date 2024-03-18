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

protocol CustomBottomBannerViewDelegate: AnyObject {
    //func customBottomBannerDidCancel(_ banner: CustomBottomBannerView)
}

struct CustomBottomBannerView: View {
    
    /*var navigationService: MapboxNavigationService
     
     init(navigationService: MapboxNavigationService){
     self.navigationService = navigationService
     }*/
    
    let nf = NumberFormatter()
    let bundle: Bundle
    
    public init(delegate: CustomBottomBannerViewDelegate? = nil, remainingTime: Float, distance: Float, estimatedArrivalTime: Date, cal: Calendar, controller: CustomBottomBarViewController, bundle: Bundle) {
        self.delegate = delegate
        self.remainingTime = remainingTime
        self.distance = distance
        self.estimatedArrivalTime = estimatedArrivalTime
        self.cal = cal
        self.controller = controller
        self.nf.numberStyle = .decimal
        self.nf.minimumFractionDigits = 1
        self.nf.maximumFractionDigits = 1
        self.bundle = bundle
    }
    
    weak var delegate: CustomBottomBannerViewDelegate?
    public var remainingTime: Float
    public var distance: Float
    public var estimatedArrivalTime: Date
    public var cal: Calendar = Calendar.current
    private var controller: CustomBottomBarViewController
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
            HStack(
                content: {
                    Button(action: {
                        self.onCompleteDelivery()
                    }) {
                        let url = bundle.url(forResource: "delivery_button", withExtension: "svg")
                        if(url != nil) {
                            SVGView(contentsOf: url!)
                        }
                    }
                    .buttonBorderShape(.roundedRectangle(radius: 10))
                    .frame(width: 79, height: 48)
                    VStack(
                        content: {
                            HStack(content: {
                                Text("\(Int(remainingTime/60))")
                                    .frame(height: 32)
                                    .font(.system(size: 32, weight: .semibold))
                                    .foregroundColor(Color(red: 0, green: 0.65, blue: 0.31))
                                Text("min")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(Color(red: 0, green: 0.65, blue: 0.31))
                            })
                            HStack(spacing: 2, content: {
                                let url1 = bundle.url(forResource: "location_icon", withExtension: "svg")
                                if(url1 != nil) {
                                    SVGView(contentsOf: url1!)
                                        .frame(width: 17, height: 17)
                                }
                                Text(distanceValueString(distance: distance))
                                    .font(.system(size: 16, weight: .semibold))
                                Text(distanceMeasureString(distance: distance))
                                    .font(.system(size: 12, weight: .light))
                                    .padding(.trailing, 10)
                                
                                let url2 = bundle.url(forResource: "clock_icon", withExtension: "svg")
                                if(url2 != nil) {
                                    SVGView(contentsOf: url2!)
                                        .frame(width: 17, height: 17)
                                }
                                Text(estimatedArrivalTimeString())
                                    .font(Font.headline.weight(.semibold))
                            })
                        }
                    )
                    Button(action: {
                        self.onCancel()
                    }) {
                        let url = bundle.url(forResource: "close_button", withExtension: "svg")
                        if(url != nil) {
                            SVGView(contentsOf: url!)
                        }
                    }
                    .buttonBorderShape(.roundedRectangle(radius: 10))
                    .frame(width: 79, height: 48)
                }
            ).padding(.horizontal, 20)
            
        })
        .frame(minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
        .frame(width: UIScreen.main.bounds.size.width)
        .background(.white)
    }
    
    func navigationService(_ service: NavigationService, didUpdate progress: RouteProgress, with location: CLLocation, rawLocation: CLLocation) {
        print(progress.fractionTraveled)
    }
    
    func onCancel() {
        self.controller.onCancel()
    }
    
    func onCompleteDelivery() {
        self.controller.navigationViewController?.completeDelivery()
    }
    
    func distanceValueString(distance: Float) -> String {
        var result: String
        
        if distance >= 1000 {
            self.nf.minimumFractionDigits = 1
            self.nf.maximumFractionDigits = 1
            result = nf.string(from: NSNumber(value: distance/1000))!
            //.font(Font.headline.weight(.semibold))
            //Text("km")
            //.font(Font.headline.weight(.light))
        } else {
            self.nf.minimumFractionDigits = 0
            self.nf.maximumFractionDigits = 0
            result = nf.string(from: NSNumber(value: distance))!
        }
        
        return result
    }
    
    func distanceMeasureString(distance: Float) -> String {
        return distance >= 1000 ? "km" : "m"
    }
    
    func estimatedArrivalTimeString() -> String {
        var result: String = ""
        
        if cal.component(.hour, from: estimatedArrivalTime) >= 10 && cal.component(.minute, from: estimatedArrivalTime) >= 10 {
            result = "\(cal.component(.hour, from:estimatedArrivalTime)):\(cal.component(.minute, from:estimatedArrivalTime))"
        } else if cal.component(.hour, from: estimatedArrivalTime) >= 10 && cal.component(.minute, from: estimatedArrivalTime) < 10 {
            result = "\(cal.component(.hour, from:estimatedArrivalTime)):0\(cal.component(.minute, from:estimatedArrivalTime))"
        } else if cal.component(.hour, from: estimatedArrivalTime) < 10 && cal.component(.minute, from: estimatedArrivalTime) >= 10 {
            result = "0\(cal.component(.hour, from:estimatedArrivalTime)):\(cal.component(.minute, from:estimatedArrivalTime))"
        } else {
            result = "0\(cal.component(.hour, from:estimatedArrivalTime)):0\(cal.component(.minute, from:estimatedArrivalTime))"
        }
        
        return result
    }
}

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
