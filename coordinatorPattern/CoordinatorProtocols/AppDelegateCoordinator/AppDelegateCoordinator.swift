//
//  AppDelegateCoordinator.swift
//  coordinatorPattern
//
//  Created by belal medhat on 23/01/2023.
//

import UIKit
protocol Coordinator {
    func start(status:AuthStatus)
}
struct AppCoordinator:Coordinator{
    let window: UIWindow?
    private var rootNavigationController = UINavigationController()

    init(window: UIWindow?) {
        self.window = window
    }

    func start(status:AuthStatus) {
        switch status {
        case .logged:
            let tabVC = TabbarViewController.loadController()
            tabVC.coordinator = TabbarCoordinator()
            tabVC.setViewControllers(setTabs(), animated: true)
            window?.rootViewController = tabVC
        case .notLogged:
            let vc = FirstViewController.loadController()
            vc.coordinator = FirstCoordinator(navigationController: rootNavigationController)
            rootNavigationController.isNavigationBarHidden = true
            rootNavigationController.pushViewController(vc, animated: true)
            window?.rootViewController = rootNavigationController
        default:
            print("another case")
        }
            window?.makeKeyAndVisible()
        }
    // MARK: - set the view controllers of tabbar in case user will be logged in
    private func setTabs() -> [UIViewController] {
        let vc1 = FirstViewController.loadController()
        vc1.title = "first"
        let nc1 = UINavigationController(rootViewController: vc1)
        vc1.coordinator = FirstCoordinator(navigationController: nc1)
        vc1.tabBarItem.image = UIImage(systemName: "square.and.arrow.up.on.square.fill")
        let vc2 = SecondViewController.loadController()
        let nc2 =  UINavigationController(rootViewController: vc2)
        vc2.coordinator = SecondCoordinator(navigationController: nc2)
        vc2.tabBarItem.image = UIImage(systemName: "square.and.arrow.down.on.square.fill")
        vc2.title = "second"
        return [nc1,nc2]
    }
    }
