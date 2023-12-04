//
//  AuthService.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 2.12.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser:User?
    
    static let shared = AuthService()
    
    

    @MainActor
    func login(withEmail email: String, password:String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
            
        } catch {
            print("Debug: Do not login \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password:String, username:String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
            
        } catch {
            print("Debug: Do not create user \(error.localizedDescription)")
        }
            
        }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)

    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    
        
    }
    
    private func uploadUserData(uid: String, username:String, email:String) async {
        
        let user = User(id: uid, username: username, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
}
    

    

