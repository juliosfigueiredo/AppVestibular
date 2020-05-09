//
//  TestExtensions.swift
//  DataTests
//
//  Created by Julio Figueiredo on 08/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    func checkMemoryLeak(for instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, file: file, line: line)
        }
    }
}
