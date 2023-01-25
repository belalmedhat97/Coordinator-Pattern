//
//  FirstViewControllerCoordinator.swift
//  coordinatorPattern
//
//  Created by belal medhat on 23/01/2023.
//

import UIKit
protocol firstCoordinatorProtocol {
    func pushView(data:Any?,view:FirstViewController,animation:Bool)
}
struct FirstCoordinator:firstCoordinatorProtocol{
    private var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
           self.navigationController = navigationController
    }
    
    func pushView(data:Any?,view:FirstViewController,animation:Bool) {
        let vc = SecondViewController.loadController()
        if let stringData = data as? String {
            vc.titleString = stringData
        }else{
            vc.titleString = "wrong data format"
        }
        vc.delegate = view
        vc.coordinator = SecondCoordinator(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: animation)
    }
}
//MARK: - Mock for first coordinator 
class firstCoordinatorMock:firstCoordinatorProtocol{
    private var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
           self.navigationController = navigationController
    }
    var didNavigate:Bool = false
    func pushView(data: Any?, view: FirstViewController, animation: Bool) {
        didNavigate = true
        
    }
    
    
}
