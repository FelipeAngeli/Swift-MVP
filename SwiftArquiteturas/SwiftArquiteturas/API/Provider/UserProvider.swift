//
//  UserProvider.swift
//  SwiftArquiteturas
//
//  Created by Felipe  on 26/01/23.
//

import Foundation
import FirebaseAuth

//protocol = assinatura
protocol UserProviderProtocol{
    func register(parameters: [AnyHashable: Any], completionHander:
    @escaping(Result<UserModel, Error>) -> Void )

    func login(parameters: [AnyHashable: Any], completionHander: @escaping(Result<UserModel, Error>) -> Void)
}

class UserProvider: UserProviderProtocol{
    lazy var auth = Auth.auth()

    func login(parameters: [AnyHashable : Any], completionHander: @escaping (Result<UserModel, Error>) -> Void) {
        let body : NSDictionary = parameters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        //chamda
        self.auth.signIn(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHander(.failure(error))
            } else {
                completionHander(.success(userModel))
            }
        }
    }

    func register(parameters: [AnyHashable : Any], completionHander: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel

        self.auth.createUser(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHander(.failure(error))
            } else {
                completionHander(.success(userModel))
            }

        }
    }

  
    
    
}
