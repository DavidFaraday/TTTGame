//
//  ServiceDependencies.swift
//  TTTGame
//
//  Created by David Kababyan on 02/05/2023.
//

import Foundation
import Factory

extension Container {
    
    var firebaseRepository: Factory<FirebaseRepositoryProtocol> {
        self { FirebaseRepository() }
            .shared
    }
}
