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
        let url = makeUrl()
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.add(addContaModel: makeAddAccountModel()) { _ in }
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    // Testar o data
    func test_add_shoud_call_httpClient_with_correct_data() {
        let (sut, httpClientSpy) = makeSut()
        let addAccountModel = makeAddAccountModel()
        sut.add(addContaModel: addAccountModel) { _ in }
        XCTAssertEqual(httpClientSpy.data, addAccountModel.toData())
    }
    // Testar o erro se client falhar
    func test_add_shoud_complete_with_error_if_client_completes_with_error() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.unexpected), when: {
            httpClientSpy.completeWithError(.noConnectivity)
        })
    }
    // Testar data valido
    func test_add_shoud_complete_with_error_if_client_completes_with_valid_data() {
        let (sut, httpClientSpy) = makeSut()
        let account = makeAccountModel()
        expect(sut, completeWith: .success(account), when: {
            httpClientSpy.completeWithData(account.toData()!)
        })
    }
    // Testar data invalido
    func test_add_shoud_complete_with_error_if_client_completes_with_invalid_data() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.unexpected), when: {
            httpClientSpy.completeWithData(makeInvalidData())
        })
    }
}

extension RemoteAddAccountTests {
    func makeSut(url: URL = URL(string: "www.globo.com")!) -> (sut: RemoteAddAccount, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        return (sut, httpClientSpy)
    }
    
    func expect(_ sut: RemoteAddAccount, completeWith expectResult: Result<AccountModel, DomainError>, when action: () -> Void) {
        let exp = expectation(description: "waiting")
        sut.add(addContaModel: makeAddAccountModel()) { receivedResult in
            switch (expectResult, receivedResult) {
            case (.failure(let expectedError), .failure(let receivedError)): XCTAssertEqual(expectedError, receivedError)
            case (.success(let expectedAccount), .success(let receivedAccount)): XCTAssertEqual(expectedAccount, receivedAccount)
            default: XCTFail("Expected \(expectResult) received \(receivedResult) instead")
            }
            exp.fulfill()
        }
        action()
        wait(for: [exp], timeout: 1)
    }
    
    func makeUrl() -> URL {
        return URL(string: "www.globo.com")!
    }
    
    func makeInvalidData() -> Data {
        return Data("invalid_data".utf8)
    }
    
    func makeAddAccountModel() -> AddAccountModel {
        return AddAccountModel(name: "any_name", email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
    }
    
    func makeAccountModel() -> AccountModel {
        return AccountModel(name: "any_name", email: "any_email@mail.com", password: "any_password")
    }
    
    class HttpClientSpy: HttpPostClient {
        var urls = [URL]()
        var data: Data?
        var completion: ((Result<Data, HttpError>) -> Void)?
        
        func post(to url: URL, with data: Data?, completion: @escaping (Result<Data, HttpError>) -> Void) {
            self.urls.append(url)
            self.data = data
            self.completion = completion
        }
        
        func completeWithError(_ error: HttpError) {
            completion?(.failure(error))
        }
        
        func completeWithData(_ data: Data) {
            completion?(.success(data))
        }
    }
}
