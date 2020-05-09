//
//  HttpError.swift
//  Data
//
//  Created by Julio Figueiredo on 08/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
