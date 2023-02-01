//
//  UserModel.swift
//  SwiftArquiteturas
//
//  Created by Felipe  on 26/01/23.
//

import Foundation


struct UserModel: Codable {
    let email: String
    let password: String
    
    //init = inicializadores
    init() {
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String){
        self.email = email
        self.password = password
    }
}
