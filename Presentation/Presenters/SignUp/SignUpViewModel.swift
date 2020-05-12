//
//  SignUpViewModel.swift
//  Presentation
//
//  Created by Julio Figueiredo on 12/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public struct SignUpViewModel {
    public var cpf: String?
    public var name: String?
    public var dataNascimento: String?
    public var anoConclusaoEnsinoMedio: Int64?
    public var email: String?
    public var password: String?
    public var passwordConfirmation: String?
    
    public init(cpf: String? = nil, name: String? = nil, dataNascimento: String? = nil, anoConclusaoEnsinoMedio: Int64? = nil, email: String? = nil, password: String? = nil, passwordConfirmation: String? = nil) {
        self.cpf = cpf
        self.name = name
        self.dataNascimento = dataNascimento
        self.anoConclusaoEnsinoMedio = anoConclusaoEnsinoMedio
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
