//
//  ContentViewModel.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 2.12.2023.
//

import Foundation
import Firebase
import Combine

class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser:User?
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers(){
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] currenUser in
            self?.currentUser = currenUser
        }
        .store(in: &cancellables)
    }
    
    
    
}
