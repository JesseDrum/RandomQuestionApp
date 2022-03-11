//
//  q3VC.swift
//  RandomQuestionApp
//
//  Created by Drum, Jesse on 2/8/22.
//

import UIKit

class q3VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var QLable: UILabel!
    
    @IBOutlet weak var QView: UIImageView!
    
    @IBAction func A1B(_ sender: Any) {
    CorrectAlert()
    }
    
    @IBAction func A2B(_ sender: Any) {
   WrongAlert()
    }
    
    @IBAction func A3B(_ sender: Any) {
   WrongAlert()
    }
    
    @IBAction func A4B(_ sender: Any) {
   WrongAlert()
    }
  
    
    func CorrectAlert()
    {
        let alert = UIAlertController(title: "Correct", message: "You Got It Right!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
    
    func WrongAlert()
    {
        let alert = UIAlertController(title: "Wrong", message: "Sorry That Wrong", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))

        self.present(alert, animated: true)
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
