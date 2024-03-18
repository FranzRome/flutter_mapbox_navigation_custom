//
//  CustomBarsViewController.swift
//  flutter_mapbox_navigation
//
//  Created by Francesco Romeo on 01/03/24.
//

import Foundation
import UIKit
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections

class CustomBottomBarViewController: ContainerViewController, CustomBottomBannerViewDelegate {
    weak var navigationViewController: FlutterMapboxNavigationView?
    var bundle: Bundle?
    
    // Or you can implement your own UI elements
    lazy var bannerView: HostingView<CustomBottomBannerView> = ({
        var banner = HostingView<CustomBottomBannerView>(rootView: CustomBottomBannerView(remainingTime: 10, distance: 10, estimatedArrivalTime: NSDate.now, cal: Calendar.current, controller: self, bundle: bundle!))
        banner.translatesAutoresizingMaskIntoConstraints = false
        
        banner.rootView.delegate = self
        return banner
    }())
    
    init(navigationViewController: FlutterMapboxNavigationView? = nil) {
        self.navigationViewController = navigationViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func onCancel() {
        print("CustomBottomBarViewController")
        
        self.navigationViewController?.onCancel()
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(bannerView)

        NSLayoutConstraint.activate([
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerView.heightAnchor.constraint(equalTo: view.heightAnchor),
            bannerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupConstraints()
    }
    
    private func setupConstraints() {
        if let superview = view.superview?.superview {
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    
    func navigationService(_ service: NavigationService, didUpdate progress: RouteProgress, with location: CLLocation, rawLocation: CLLocation) {
        bannerView.rootView.remainingTime = Float(progress.durationRemaining)
        bannerView.rootView.distance = Float(progress.distanceRemaining)
        bannerView.rootView.estimatedArrivalTime = NSCalendar.current.date(byAdding: .second, value: Int(progress.durationRemaining), to: Date())!
    }
}
