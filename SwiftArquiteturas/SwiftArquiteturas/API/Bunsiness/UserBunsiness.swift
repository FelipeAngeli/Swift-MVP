//
//  UserBusiness.swift
//  SwiftArquiteturas
//
//  Created by Felipe  on 27/01/23.
//

import Foundation


protocol UserBusinessProtocol {
    func register(email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func login(email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
}


class UserBusiness: UserBusinessProtocol {
    let provider: UserProvider = UserProvider()
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        provider.login(parameters: getParams(email, password)) { result in
            switch result {
                case .success(let userModel):
                    completionHandler(.success(userModel))
                    
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        }
    }
    
    func register(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        provider.register(parameters: getParams(email, password)) { result in
            switch result {
                case .success(let userModel):
                    completionHandler(.success(userModel))
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        }
    }
   
    // para nao duplicar o codigo acima e o _ sublime de precisar por o email e password
    private func getParams(_ email: String,_ password: String) -> [AnyHashable: Any] {
        let userModel = UserModel(email: email, password: password)
        let params: [AnyHashable: Any] = [Constants.ParametersKeys.body: [Constants.ParametersKeys.userModel: userModel]]
        
        return params
    }
}
