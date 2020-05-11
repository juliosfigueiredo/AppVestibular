//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by Julio Figueiredo on 10/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest

class SignUpPresenter {
    private let alertView: AlertView
    init(alertView: AlertView) {
        self.alertView = alertView
    }
    func signUp(viewModel: SignUpViewModel) {
        if viewModel.cpf == nil || ((viewModel.cpf?.isEmpty) != nil) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: "O campo Nome é obrigatorio"))
        }
    }
}

protocol AlertView {
    func showMessage(viewModel: AlertViewModel)
}

struct AlertViewModel: Equatable {
    var title: String
    var message: String
}

struct SignUpViewModel {
    var cpf: String?
    var name: String?
    var dataNascimento: String?
    var anoConclusaoEnsinoMedio: Int64?
    var email: String?
    var password: String?
    var passwordConfirmation: String?
}

class SignPresenterTests: XCTestCase {
    func test_signUp_should_show_error_message_if_cpf_is_not_provider() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = SignUpViewModel(name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Nome é obrigatorio"))
    }
}

extension SignPresenterTests {
    func makeSut() -> (sut: SignUpPresenter, alertViewSpy: AlertViewSpy) {
        let alertViewSpy = AlertViewSpy()
        let sut = SignUpPresenter(alertView: alertViewSpy)
        return (sut, alertViewSpy)
    }
    class AlertViewSpy: AlertView {
        var viewModel: AlertViewModel?
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
    }
}
