//
//  ThirdViewControllerCoordinator.swift
//  coordinatorPattern
//
//  Created by belal medhat on 23/01/2023.
//

import UIKit
protocol ThirdCoordinatorProtocol {
    func popView(animation:Bool)
    func popToRoot(animation:Bool)
}
struct ThirdCoordinator:ThirdCoordinatorProtocol{
    
    private var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
           self.navigationController = navigationController
    }
    
    func popView(animation: Bool) {
        self.navigationController.popViewController(animated: animation)
    }
    func popToRoot(animation: Bool) {
        self.navigationController.popToRootViewController(animated: animation)
    }
}
//MARK: - Mock for third coordinator
class ThirdCoordinatorMock:ThirdCoordinatorProtocol{
    
    private var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
           self.navigationController = navigationController
    }
    var didbackRoot:Bool = false
    var didback:Bool = false

    func popView(animation: Bool) {
        didback = true
        
    }
    func popToRoot(animation: Bool) {
        didbackRoot = true
        
    }
}
