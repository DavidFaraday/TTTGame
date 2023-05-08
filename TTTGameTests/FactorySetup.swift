//
//  FactorySetup.swift
//  TTTGameTests
//
//  Created by David Kababyan on 08/05/2023.
//

import Foundation
import Factory

@testable import TTTGame

extension Container {
    static func setupMocs(shouldReturnNil: Bool = false) {
        Container.shared.firebaseRepository.register {
            MocFirebaseRepository(shouldReturnNil: shouldReturnNil)
        }
    }
}
