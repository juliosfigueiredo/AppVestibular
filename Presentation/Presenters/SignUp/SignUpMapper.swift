//
//  SignUpMapper.swift
//  Presentation
//
//  Created by Julio Figueiredo on 12/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

public final class SignUpMapper {
    static func toAddAccountModel(viewModel: SignUpViewModel) -> AddAccountModel {
        return AddAccountModel(cpf: viewModel.cpf!, name: viewModel.name!, dataNascimento: viewModel.dataNascimento!, anoConclusaoEnsinoMedio: viewModel.anoConclusaoEnsinoMedio!, email: viewModel.email!, password: viewModel.password!, passwordConfirmation: viewModel.passwordConfirmation!)
    }
}
