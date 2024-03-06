//
//  CustomBottomBannerView2.swift
//  flutter_mapbox_navigation
//
//  Created by Francesco Romeo on 01/03/24.
//

import SwiftUI
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections

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
        VStack{
            Spacer().frame(height:25).background(.white)
            Text("\(Int(remainingTime/60)) min").frame(maxWidth: .infinity)
            HStack {
                Button(action: {
                    self.onCompleteDelivery()
                }) {
                    Image("box")
                        .resizable() // This allows the image to be resized
                        .frame(width: 30, height: 30)
                }
                distance > 1000
                ? Text("\(Int(distance/1000))km").frame(maxWidth: .infinity)
                : Text("\(Int(distance))m").frame(maxWidth: .infinity)
                Text("\(cal.component(.hour, from:estimatedArrivalTime)):\(cal.component(.minute, from:estimatedArrivalTime))").frame(maxWidth: .infinity)
                Button(action: {
                    self.onCancel()
                }, label: {
                    Image(systemName: "x.circle").frame(width: 30, height: 30).foregroundColor(Color(red: 0, green: 0.412, blue: 0.196))
                })
                
            }.padding(.horizontal, 60)
            Spacer().frame(height:50).background(.white)
        }//.ignoresSafeArea(edges: [.bottom])
        .frame(width: UIScreen.main.bounds.width)
        /* .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in
                UIScreen.main.bounds.width/2
            })*/
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
