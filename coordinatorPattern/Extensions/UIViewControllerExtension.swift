//
//  UiviewControllerExtension.swift
//  coordinatorPattern
//
//  Created by belal medhat on 23/01/2023.
//

import UIKit
extension UIViewController {
    class func loadController() -> Self {
         return Self(nibName: String(describing: self), bundle: nil)
         //Or You can use this as well
         //Self.init(nibName: String(describing: self), bundle: nil)
    }
}
