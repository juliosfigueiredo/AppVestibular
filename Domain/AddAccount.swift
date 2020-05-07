//
//  AddAccount.swift
//  Domain
//
//  Created by Julio Figueiredo on 07/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

protocol AddAccount {
    func add(addContaModel: AddAccountModel, completion: @escaping (Result<AccountModel, Error>) -> Void)
}

struct AddAccountModel {
    var name: String
    var email: String
    var password: String
    var passwordConfirmation: String
}
