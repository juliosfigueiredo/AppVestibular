//
//  AccountModel.swift
//  Domain
//
//  Created by Julio Figueiredo on 07/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public struct AccountModel: Model {
    public var name: String
    public var email: String
    public var password: String
    
    public init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
