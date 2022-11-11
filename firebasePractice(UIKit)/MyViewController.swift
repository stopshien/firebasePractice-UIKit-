//
//  MyViewController.swift
//  firebasePractice(UIKit)
//
//  Created by 沈庭鋒 on 2022/11/11.
//

import UIKit
import FirebaseAuth

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogoutBtn(_ sender: Any){
        
        if Auth.auth().currentUser != nil {
                do {
                    try Auth.auth().signOut()
                    dismiss(animated: true, completion: nil)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        
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
