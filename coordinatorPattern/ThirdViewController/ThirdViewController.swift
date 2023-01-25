//
//  ThirdViewController.swift
//  coordinatorPattern
//
//  Created by belal medhat on 18/01/2023.
//

import UIKit

class ThirdViewController: UIViewController{
    var coordinator:ThirdCoordinatorProtocol?
    var delegate:PassDataBackProtocols?
    var textData:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLbl.text = textData
        // Do any additional setup after loading the view.
    }
    @IBAction func backRootBtn(_ sender: Any) {
        coordinator?.popToRoot(animation: true)
    }
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBAction func back(_ sender: Any) {
        delegate?.returnData(data: "back from screen 3 to screen 2")
        coordinator?.popView(animation: true)
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
