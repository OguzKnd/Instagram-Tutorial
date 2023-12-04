//
//  CurrentUserProfileView.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 30.11.2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user:User
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                
                ProfileHeaderView(user: user)
                
                // post grid view
                
                PostGridView(user: user)
            }
            
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
            
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USER[0])
}
