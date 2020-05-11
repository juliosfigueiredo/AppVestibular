//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by Julio Figueiredo on 10/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import Presentation

class SignPresenterTests: XCTestCase {
    func test_signUp_should_show_error_message_if_cpf_is_not_provider() {
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        let signUpViewModel = SignUpViewModel(name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo CPF é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_name_is_not_provider() {
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        let signUpViewModel = SignUpViewModel(cpf: "any_cpf", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Nome é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_email_is_not_provider() {
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        let signUpViewModel = SignUpViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Email é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_password_is_not_provider() {
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        let signUpViewModel = SignUpViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Senha é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_passwordConfirmation_is_not_provider() {
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        let signUpViewModel = SignUpViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email", password: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Confirmar Senha é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_passwordConfirmation_not_match() {
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        let signUpViewModel = SignUpViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email", password: "any_password", passwordConfirmation: "wrong_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Falha ao confirmar senha"))
    }
    
    func test_signUp_should_call_emailValidator_with_correct_email() {
        let emailValidatorSpy = EmailValidatorSpy()
        let sut = makeSut(emailValidator: emailValidatorSpy)
        let signUpViewModel = SignUpViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "invalid_email", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(emailValidatorSpy.email, signUpViewModel.email)
    }
    
    func test_signUp_should_show_error_message_invalid_email_is_provided() {
        let alertViewSpy = AlertViewSpy()
        let emailValidatorSpy = EmailValidatorSpy()
        let sut = makeSut(alertView: alertViewSpy, emailValidator: emailValidatorSpy)
        let signUpViewModel = SignUpViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email", password: "any_password", passwordConfirmation: "any_password")
        emailValidatorSpy.isValid = false
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Email invalido"))
    }
}

extension SignPresenterTests {
    func makeSut(alertView: AlertViewSpy = AlertViewSpy(), emailValidator: EmailValidatorSpy = EmailValidatorSpy()) -> SignUpPresenter {
        let sut = SignUpPresenter(alertView: alertView, emailValidator: emailValidator)
        return sut
    }
    class AlertViewSpy: AlertView {
        var viewModel: AlertViewModel?
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
    }
    
    class EmailValidatorSpy: EmailValidator {
        var isValid = true
        var email: String?
        
        func isValid(email: String) -> Bool {
            self.email = email
            return isValid
        }
    }
}
