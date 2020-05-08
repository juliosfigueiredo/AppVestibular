//
//  DataTests.swift
//  DataTests
//
//  Created by Julio Figueiredo on 07/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import Domain

class RemoteAddAccount {
    private let url: URL
    private let httpClient: HttpPostClient
    init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(addContaModel: AddAccountModel) {
        httpClient.post(url: url)
    }
}

protocol HttpPostClient {
    func post(url: URL)
}

class RemoteAddAccountTests: XCTestCase {
    // Testar url
    func test_add_shoud_call_httpClient_with_correct_url() {
        let url = URL(string: "www.globo.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        sut.add()
        XCTAssertEqual(httpClientSpy.url, url)
    }
    // Testar o data
    func test_add_shoud_call_httpClient_with_correct_data() {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: URL(string: "www.globo.com")!, httpClient: httpClientSpy)
        sut.add()
        XCTAssertEqual(httpClientSpy.data, data)
    }
}

extension RemoteAddAccountTests {
    class HttpClientSpy: HttpPostClient {
        var url: URL?
        
        func post(url: URL) {
            self.url = url
        }
    }
}
