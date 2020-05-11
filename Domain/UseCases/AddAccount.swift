//
//  AddAccount.swift
//  Domain
//
//  Created by Julio Figueiredo on 07/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void)
}

public struct AddAccountModel: Model {
    public var cpf: String
    public var name: String
    public var dataNascimento: String
    public var anoConclusaoEnsinoMedio: Int64
    public var email: String
    public var password: String
    public var passwordConfirmation: String
    
    public init(cpf: String, name: String, dataNascimento: String, anoConclusaoEnsinoMedio: Int64, email: String, password: String, passwordConfirmation: String) {
        self.cpf = cpf
        self.name = name
        self.dataNascimento = dataNascimento
        self.anoConclusaoEnsinoMedio = anoConclusaoEnsinoMedio
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
