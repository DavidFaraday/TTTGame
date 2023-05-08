//
//  MocFirebaseRepository.swift
//  TTTGame
//
//  Created by David Kababyan on 08/05/2023.
//

import Foundation
import Combine

final class MocFirebaseRepository: FirebaseRepositoryProtocol {
    
    let dummyGame = Game(id: "MocID",
                         player1Id: "P1ID",
                         player2Id: "P2ID",
                         player1Score: 3,
                         player2Score: 4,
                         activePlayerId: "P1ID",
                         winningPlayerId: "",
                         moves: Array(repeating: nil, count: 9))
    
    var returnNil = false
    
    init(shouldReturnNil: Bool = false) {
        returnNil = shouldReturnNil
    }
    
    
    func getDocuments<T>(from collection: FCollectionReference, for playerId: String) async throws -> [T]? where T : Decodable, T : Encodable {
        print("sending moc")
        return returnNil ? nil : [dummyGame] as? [T]
    }
    
    func listen<T>(from collection: FCollectionReference, documentId: String) async throws -> AnyPublisher<T?, Error> where T : Decodable, T : Encodable {
        
        let subject = PassthroughSubject<T?, Error>()
        
        subject.send(dummyGame as? T)
        return subject.eraseToAnyPublisher()
    }
    
    func deleteDocument(with id: String, from collection: FCollectionReference) {
        
    }
    
    func saveDocument<T>(data: T, to collection: FCollectionReference) throws where T : Encodable, T : Identifiable {
        
    }
}
