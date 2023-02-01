//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Felipe  on 31/01/23.
//

import UIKit

class RegisterViewController: UIViewController {
    let presenter: RegisterPresenter = RegisterPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextFIeld: UITextField!
    
    
    
    @IBAction func registerButtonTap(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
            password == confirmPasswordTextFIeld.text {        
            let userModel = UserModel(email: email,
                                      password: password)
            presenter.register(userModel: userModel)

        } else {
            showMessage(title: "Erro", message:"Senhas não conferem" )
        }
    }
    
    
    @IBAction func openButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}


extension RegisterViewController: RegisterPresenterDelegate{
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
    func goHome() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        home.modalPresentationStyle = .fullScreen
        
        self.present(home, animated: true)
    }
    
    
}
