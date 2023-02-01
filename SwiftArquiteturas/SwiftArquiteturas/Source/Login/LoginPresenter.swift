//
//  LoginPresenter.swift
//  SwiftArquiteturas
//
//  Created by Felipe  on 31/01/23.
//

import Foundation




//delegate
protocol LoginPresenterDelegate {
    func showMessage(title: String, message: String)
    func goHome()
   
}

class LoginPresenter {
    var delegate: LoginPresenterDelegate?
    
    func login(userModel: UserModel){
        let manager = UserManager(business: UserBusiness())
        manager.login(email: userModel.email,
                      password: userModel.password){ [weak self] model in
            self?.goHome()

        } failureHandler: { [weak self] error in
            self?.delegate?.showMessage(title: "Erro", message: error.localizedDescription)
        }
    }
    
    //faz a chamada da tela de home
    func goHome(){  
        self.delegate?.goHome()
    }
}
