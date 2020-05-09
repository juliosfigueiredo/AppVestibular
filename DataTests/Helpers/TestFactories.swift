//
//  TestFactories.swift
//  DataTests
//
//  Created by Julio Figueiredo on 08/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

func makeUrl() -> URL {
    return URL(string: "www.globo.com")!
}

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}

func makeValidData() -> Data {
    return Data("{\"name\":\"Julio\"}".utf8)
}
