//
//  FirstViewController.swift
//  coordinatorPattern
//
//  Created by belal medhat on 16/01/2023.
//

import UIKit

class FirstViewController: UIViewController {
    var coordinator:firstCoordinatorProtocol?

    @IBOutlet weak var firstLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func navBtn(_ sender: Any) {
        coordinator?.pushView(data: "from screen 1 to screen 2", view: self, animation: true)
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
extension FirstViewController:PassDataBackProtocols{
    func returnData(data: Any) {
        firstLbl.text = data as? String
    }
    
    
}
