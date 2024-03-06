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

@available(iOS 13.0, *)
class CustomBarsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let origin = CLLocationCoordinate2DMake(37.77440680146262, -122.43539772352648)
        let destination = CLLocationCoordinate2DMake(37.76556957793795, -122.42409811526268)
        let routeOptions = NavigationRouteOptions(coordinates: [origin, destination])
        
        Directions.shared.calculate(routeOptions) { [weak self] (_, result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let response):
                guard let strongSelf = self else {
                    return
                }
                
                // For demonstration purposes, simulate locations if the Simulate Navigation option is on.
                let indexedRouteResponse = IndexedRouteResponse(routeResponse: response, routeIndex: 0)
                let navigationService = MapboxNavigationService(indexedRouteResponse: indexedRouteResponse,
                                                                customRoutingProvider: NavigationSettings.shared.directions,
                                                                credentials: NavigationSettings.shared.directions.credentials,
                                                                simulating: .always)
                
                // Pass your custom implementations of `topBanner` and/or `bottomBanner` to `NavigationOptions`
                // If you do not specify them explicitly, `TopBannerViewController` and `BottomBannerViewController` will be used by default.
                // Those are `Open`, so you can also check thier source for more examples of using standard UI controls!
                let topBanner = CustomTopBarViewController()
                let bottomBanner = CustomBottomBarViewController()
                let navigationOptions = NavigationOptions(navigationService: navigationService,
                                                          topBanner: topBanner,
                                                          bottomBanner: bottomBanner)
                let navigationViewController = NavigationViewController(for: indexedRouteResponse,
                                                                        navigationOptions: navigationOptions)
                //bottomBanner.navigationViewController = navigationViewController
                
                let parentSafeArea = navigationViewController.view.safeAreaLayoutGuide
                let bannerHeight: CGFloat = 80.0
                let verticalOffset: CGFloat = 20.0
                let horizontalOffset: CGFloat = 10.0
                
                // To change top and bottom banner size and position change layout constraints directly.
                topBanner.view.topAnchor.constraint(equalTo: parentSafeArea.topAnchor).isActive = true
                
                bottomBanner.view.heightAnchor.constraint(equalToConstant: bannerHeight).isActive = true
                bottomBanner.view.bottomAnchor.constraint(equalTo: parentSafeArea.bottomAnchor, constant: -verticalOffset).isActive = true
                bottomBanner.view.leadingAnchor.constraint(equalTo: parentSafeArea.leadingAnchor, constant: horizontalOffset).isActive = true
                bottomBanner.view.trailingAnchor.constraint(equalTo: parentSafeArea.trailingAnchor, constant: -horizontalOffset).isActive = true

                navigationViewController.modalPresentationStyle = .fullScreen
                
                strongSelf.present(navigationViewController, animated: true, completion: nil)
                navigationViewController.floatingButtons = []
                navigationViewController.showsSpeedLimits = false
            }
        }
    }
    
    
    // Test code
    public func onCancel() {
        self.dismiss(animated: false)
    }
}

// MARK: - CustomTopBarViewController

class CustomTopBarViewController: ContainerViewController {
    private lazy var instructionsBannerTopOffsetConstraint = {
        return instructionsBannerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
    }()
    private lazy var centerOffset: CGFloat = calculateCenterOffset(with: view.bounds.size)
    private lazy var instructionsBannerCenterOffsetConstraint = {
        return instructionsBannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
    }()
    private lazy var instructionsBannerWidthConstraint = {
        return instructionsBannerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
    }()
    
    // You can Include one of the existing Views to display route-specific info
    lazy var instructionsBannerView: InstructionsBannerView = {
        let banner = InstructionsBannerView()
        banner.translatesAutoresizingMaskIntoConstraints = false
        banner.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        banner.layer.cornerRadius = 25
        banner.layer.opacity = 0.75
        banner.separatorView.isHidden = true
        return banner
    }()
    
    public func onCancel() {
        print("CustomTopBarViewController")
    }
    
    override func viewDidLoad() {
        view.addSubview(instructionsBannerView)
        
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateConstraints()
    }
    
    private func setupConstraints() {
        instructionsBannerCenterOffsetConstraint.isActive = true
        instructionsBannerTopOffsetConstraint.isActive = true
        instructionsBannerWidthConstraint.isActive = true
    }
    
    private func updateConstraints() {
        instructionsBannerCenterOffsetConstraint.constant = centerOffset
    }
    
    // MARK: - Device rotation
    
    private func calculateCenterOffset(with size: CGSize) -> CGFloat {
        return (size.height < size.width ? -size.width / 5 : 0)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        centerOffset = calculateCenterOffset(with: size)
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateConstraints()
    }
    
    // MARK: - NavigationServiceDelegate implementation
    
    public func navigationService(_ service: NavigationService, didUpdate progress: RouteProgress, with location: CLLocation, rawLocation: CLLocation) {
        // pass updated data to sub-views which also implement `NavigationServiceDelegate`
        instructionsBannerView.updateDistance(for: progress.currentLegProgress.currentStepProgress)
    }
    
    public func navigationService(_ service: NavigationService, didPassVisualInstructionPoint instruction: VisualInstructionBanner, routeProgress: RouteProgress) {
        instructionsBannerView.update(for: instruction)
    }
    
    public func navigationService(_ service: NavigationService, didRerouteAlong route: Route, at location: CLLocation?, proactive: Bool) {
        instructionsBannerView.updateDistance(for: service.routeProgress.currentLegProgress.currentStepProgress)
    }
}

// MARK: - CustomBottomBarViewController

@available(iOS 13.0, *)
class CustomBottomBarViewController: ContainerViewController, CustomBottomBannerViewDelegate {
    weak var navigationViewController: FlutterMapboxNavigationView?
    
    
    // Or you can implement your own UI elements
    lazy var bannerView: HostingView<CustomBottomBannerView> = ({
        var banner = CustomBottomBannerView(remainingTime: 10, distance: 10, estimatedArrivalTime: NSDate.now, cal: Calendar.current, controller: self)
        //print("aaaa")
        //banner.translatesAutoresizingMaskIntoConstraints = false
        
        banner.delegate = self
        return HostingView(rootView: banner)
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
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)

        //let safeArea = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 15),
            bannerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupConstraints()
    }
    
    private func setupConstraints() {
        if let superview = view.superview?.superview {
            view.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
        }
    }
    
    // MARK: - NavigationServiceDelegate implementation
    
    func navigationService(_ service: NavigationService, didUpdate progress: RouteProgress, with location: CLLocation, rawLocation: CLLocation) {
        // Update your controls manually
        //print(progress.fractionTraveled)
        bannerView.rootView.remainingTime = Float(progress.durationRemaining)
        bannerView.rootView.distance = Float(progress.distanceRemaining)
        bannerView.rootView.estimatedArrivalTime = NSCalendar.current.date(byAdding: .second, value: Int(progress.durationRemaining), to: Date())!
        //bannerView.eta = "~\(Int(round(progress.durationRemaining / 60))) min"
    }
    
    // MARK: - CustomBottomBannerViewDelegate implementation
    
    /*func customBottomBannerDidCancel(_ banner: CustomBottomBannerView) {
        navigationViewController?.dismiss(animated: true,
                                          completion: nil)
    }*/
}
