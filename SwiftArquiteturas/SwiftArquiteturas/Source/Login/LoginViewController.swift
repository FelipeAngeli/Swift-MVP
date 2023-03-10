//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Felipe  on 31/01/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController{
    let presenter: LoginPresenter = LoginPresenter()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func openButtonTap(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            let userModel = UserModel(email: email,
                                      password: password)
            presenter.login(userModel: userModel)
        }
    }
    
    
    
    @IBAction func registerButtonTap(_ sender: Any) {
        let register = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        register.modalPresentationStyle = .fullScreen
        
        self.present(register, animated: true)
    }
    

}

extension LoginViewController: LoginPresenterDelegate{
    func goHome() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            home.modalPresentationStyle = .fullScreen
        
        self.present(home, animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated:true, completion: nil)
    }
}

