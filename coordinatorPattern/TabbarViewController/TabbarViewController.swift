//
//  TabbarViewController.swift
//  coordinatorPattern
//
//  Created by belal medhat on 18/01/2023.
//

import UIKit

class TabbarViewController: UITabBarController,UITabBarControllerDelegate {
    var coordinator:TabbarCoordinatorProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .lightGray
        self.delegate = self
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .green
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @IBOutlet weak var tabbrVI: UITabBar!
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        coordinator?.changeTab(idx: tabBarController.selectedIndex)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
