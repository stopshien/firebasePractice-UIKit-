//
//  ViewController.swift
//  firebasePractice(UIKit)
//
//  Created by 沈庭鋒 on 2022/11/11.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
            Auth.auth().addStateDidChangeListener { (auth, user) in
                if user != nil {
                    self.performSegue(withIdentifier: "Login", sender: nil)
                }
            }

    }

    @IBAction func loginBtn(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                    if (error != nil) {
                        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "Error", style: .cancel, handler: nil)
                        alert.addAction(defaultAction)
                        self.present(alert, animated: true, completion: nil)
                    }
            
        }
    
    }
    
    
    @IBAction func registerBtn(_ sender: Any) {
        
        
    let signUpAlert = UIAlertController(title: "註冊", message: "註冊", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "儲存", style: .default) { (action) in
                       let emailSignUpTextField = signUpAlert.textFields![0]
                       let passwordSignUpTextField = signUpAlert.textFields![1]
                       Auth.auth().createUser(withEmail: emailSignUpTextField.text!, password: passwordSignUpTextField.text!, completion: { (user, error) in
                           if error == nil {
                               Auth.auth().signIn(withEmail: emailSignUpTextField.text!, password: passwordSignUpTextField.text!, completion: nil)
                           } else {
                               let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                               let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                               alert.addAction(defaultAction)
                               self.present(alert, animated: true, completion: nil)
                           }
                       })
                   }
                   
                   let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                   
                   signUpAlert.addTextField { (emailSignUpTextField) in
                       emailSignUpTextField.placeholder = "請輸入Email"
                   }
                   signUpAlert.addTextField { (passwordSignUpTextField) in
                       passwordSignUpTextField.placeholder = "請輸入密碼"
                       passwordSignUpTextField.isSecureTextEntry = true
                   }
                   
                   signUpAlert.addAction(saveAction)
                   signUpAlert.addAction(cancelAction)
                   
                   present(signUpAlert, animated: true, completion: nil)
        
        
    }
    
    
    
    
}

