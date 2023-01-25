//
//  SecondViewController.swift
//  coordinatorPattern
//
//  Created by belal medhat on 16/01/2023.
//

import UIKit

class SecondViewController: UIViewController {
    var coordinator:SecondCoordinatorProtocol?
    var titleString:String = ""
    var delegate:PassDataBackProtocols?

    override func viewDidLoad() {
        super.viewDidLoad()
        textLbl.text = titleString
        // Do any additional setup after loading the view.
    }
    
    @IBAction func navBtn(_ sender: Any) {
        coordinator?.pushView(data:"from screen 2 to screen 3",view: self, animation: true)
    }
    @IBOutlet weak var textLbl: UILabel!
    
    @IBAction func backBtn(_ sender: Any) {
        delegate?.returnData(data: "back from screen 2 to screen 1")
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
extension SecondViewController:PassDataBackProtocols{
    func returnData(data:Any){

            self.textLbl.text = data as? String
        
    }

}
