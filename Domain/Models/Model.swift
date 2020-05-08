//
//  Model.swift
//  Domain
//
//  Created by Julio Figueiredo on 07/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

protocol Model: Encodable {}

public extension AddAccountModel {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
