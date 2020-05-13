//
//  TestFactories.swift
//  PresentationTests
//
//  Created by Julio Figueiredo on 12/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Presentation

func makeSignUpViewModel(cpf: String? = "any_cpf", name: String? = "any_name", dataNascimento: String? = "any_nascimento", anoConclusaoEnsinoMedio: Int64? = 2020, email: String? = "any_email@mail.com", password: String? = "any_password", passwordConfirmation: String? = "any_password") -> SignUpViewModel {
    return SignUpViewModel(cpf: cpf, name: name, dataNascimento: dataNascimento, anoConclusaoEnsinoMedio: anoConclusaoEnsinoMedio, email: email, password: password, passwordConfirmation: passwordConfirmation)
}

func makeRequeridAlertViewModel(fieldName: String) -> AlertViewModel {
    return AlertViewModel(title: "Falha na validação", message: "O campo \(fieldName) é obrigatorio")
}

func makeInvalidAlertViewModel(fieldName: String) -> AlertViewModel {
    return AlertViewModel(title: "Falha na validação", message: "O campo \(fieldName) é inválido")
}

func makeErrorAlertViewModel(message: String) -> AlertViewModel {
    return AlertViewModel(title: "Erro", message: message)
}

func makeSuccessAlertViewModel(message: String) -> AlertViewModel {
    return AlertViewModel(title: "Sucesso", message: message)
}
