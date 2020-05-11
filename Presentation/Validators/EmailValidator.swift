//
//  EmailValidator.swift
//  Presentation
//
//  Created by Julio Figueiredo on 11/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public protocol EmailValidator {
    func isValid(email: String) -> Bool
}
