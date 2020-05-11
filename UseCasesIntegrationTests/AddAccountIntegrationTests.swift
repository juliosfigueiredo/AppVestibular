//
//  AddAccountIntegrationTests.swift
//  AddAccountIntegrationTests
//
//  Created by Julio Figueiredo on 10/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import Data
import Infra
import Domain

class AddAccountIntegrationTests: XCTestCase {
    func test_add_account() throws {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "www.globo.com")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(cpf: "27569820835", name: "Julio Figueiredo", dataNascimento: "14/07/1979", anoConclusaoEnsinoMedio: 2020, email: "julio@unip.br", password: "secret", passwordConfirmation: "secret")
        let exp = expectation(description: "waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            switch result {
            case .failure: XCTFail("Expect sucess got \(result) instead")
            case .success(let account):
                //XCTAssertNotNil((account.id))
                XCTAssertEqual(account.name, addAccountModel.name)
                XCTAssertEqual(account.email, addAccountModel.email)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
}
