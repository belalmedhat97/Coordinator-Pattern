//
//  SecondViewControllerCoordinator.swift
//  coordinatorPattern
//
//  Created by belal medhat on 23/01/2023.
//

import UIKit
protocol SecondCoordinatorProtocol {
    func pushView(data:Any?,view:SecondViewController,animation:Bool)
    func popView(animation: Bool)
}
struct SecondCoordinator:SecondCoordinatorProtocol{

    private var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
           self.navigationController = navigationController
    }
    
    func pushView(data:Any?,view:SecondViewController,animation:Bool) {
        let vc = ThirdViewController.loadController()
        if let stringData = data as? String {
            vc.textData = stringData
        }else{
            vc.textData = "wrong data format"
        }
        vc.coordinator = ThirdCoordinator(navigationController: navigationController)
        vc.delegate = view
        navigationController.pushViewController(vc, animated: animation)
    }
    func popView(animation: Bool) {
        self.navigationController.popViewController(animated: animation)
    }
}
//MARK: - Mock for second coordinator
class SecondCoordinatorMock:SecondCoordinatorProtocol{

    private var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
           self.navigationController = navigationController
    }
    var didNavigate:Bool = false
    var dataPassed:String = ""
    var didback:Bool = false
    func pushView(data:Any?,view:SecondViewController,animation:Bool) {
        didNavigate = true
        if let stringData = data as? String {
            dataPassed = stringData
        }else{
            dataPassed = "wrong data format"
        }
    }
    func popView(animation: Bool) {
        didback = true
    }
}
