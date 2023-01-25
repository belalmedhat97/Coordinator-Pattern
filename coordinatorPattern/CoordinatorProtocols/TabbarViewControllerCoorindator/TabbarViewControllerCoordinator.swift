//
//  TabbarViewControllerCoordinator.swift
//  coordinatorPattern
//
//  Created by belal medhat on 24/01/2023.
//

import UIKit
protocol TabbarCoordinatorProtocol {
    func changeTab(idx:Int)
}

struct TabbarCoordinator:TabbarCoordinatorProtocol{

    func changeTab(idx:Int) {
        switch idx {
        case 0:
            let vc = FirstViewController.loadController()

        default:
            let vc = FirstViewController.loadController()

        }
    }
    
}
