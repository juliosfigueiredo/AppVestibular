//
//  HttpClientSpy.swift
//  DataTests
//
//  Created by Julio Figueiredo on 08/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Data

class HttpClientSpy: HttpPostClient {
    var urls = [URL]()
    var data: Data?
    var completion: ((Result<Data?, HttpError>) -> Void)?
    
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, HttpError>) -> Void) {
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
