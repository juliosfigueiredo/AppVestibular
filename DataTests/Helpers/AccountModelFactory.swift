//
//  AccountModelFactory.swift
//  DataTests
//
//  Created by Julio Figueiredo on 08/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

func makeAccountModel() -> AccountModel {
    return AccountModel(name: "any_name", email: "any_email@mail.com", password: "any_password")
}
