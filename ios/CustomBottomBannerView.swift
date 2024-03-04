//
//  CustomBottomBannerView2.swift
//  flutter_mapbox_navigation
//
//  Created by Francesco Romeo on 01/03/24.
//

import SwiftUI
import MapboxCoreNavigation

@available(iOS 13.0, *)
protocol CustomBottomBannerViewDelegate: AnyObject {
    func customBottomBannerDidCancel(_ banner: CustomBottomBannerView)
}

@available(iOS 13.0, *)
struct CustomBottomBannerView: View {
    
    /*var navigationService: MapboxNavigationService
    
    init(navigationService: MapboxNavigationService){
        self.navigationService = navigationService
    }*/
    
    weak var delegate: CustomBottomBannerViewDelegate?
    var remainingTime: Float
    var distance: Float
    var estimatedTime: Float
    
    //@State var remainingTime: Float = 0.5
    var body: some View {
        VStack {
            Text("Remaining Time \(remainingTime)").frame(maxWidth: .infinity)
            HStack {
                Text("Distance \(distance)").frame(maxWidth: .infinity)
                Spacer()
                Text("Estimated Time \(estimatedTime)").frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 8)
        }.frame(width: UIScreen.main.bounds.width, height: 160)
            .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in
                UIScreen.main.bounds.width/2
            })
            .background(Color.white)
    }
    
    func onCancel() {
        // Implementa l'azione del pulsante "Cancel"
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
