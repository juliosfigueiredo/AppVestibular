//
//  RemoteAddAccount.swift
//  Data
//
//  Created by Julio Figueiredo on 07/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

public final class RemoteAddAccount {
    private let url: URL
    private let httpClient: HttpPostClient
    
    public init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    public func add(addContaModel: AddAccountModel) {
        httpClient.post(to: url, with: addContaModel.toData())
    }
}
