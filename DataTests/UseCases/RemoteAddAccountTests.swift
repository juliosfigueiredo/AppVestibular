//
//  DataTests.swift
//  DataTests
//
//  Created by Julio Figueiredo on 07/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import Domain
import Data

class RemoteAddAccountTests: XCTestCase {
    // Testar url
    func test_add_shoud_call_httpClient_with_correct_url() {
        let url = URL(string: "www.globo.com")!
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.add(addContaModel: makeAddAccountModel())
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    // Testar o data
    func test_add_shoud_call_httpClient_with_correct_data() {
        let (sut, httpClientSpy) = makeSut()
        let addAccountModel = makeAddAccountModel()
        sut.add(addContaModel: addAccountModel)
        XCTAssertEqual(httpClientSpy.data, addAccountModel.toData())
    }
}

extension RemoteAddAccountTests {
    func makeSut(url: URL = URL(string: "www.globo.com")!) -> (sut: RemoteAddAccount, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        return (sut, httpClientSpy)
    }
    func makeAddAccountModel() -> AddAccountModel {
        return AddAccountModel(name: "any_name", email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
    }
    class HttpClientSpy: HttpPostClient {
        var urls = [URL]()
        var data: Data?
        
        func post(to url: URL, with data: Data?) {
            self.urls.append(url)
            self.data = data
        }
    }
}
