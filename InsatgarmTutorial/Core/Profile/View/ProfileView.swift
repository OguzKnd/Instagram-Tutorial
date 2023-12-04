//
//  ProfileView.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 28.11.2023.
//

import SwiftUI

struct ProfileView: View {
    
    var user: User

    
    var body: some View {
            ScrollView {
                // header
                ProfileHeaderView(user: user)

                
                // post grid view
                
               PostGridView(user: user)
            }
            
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER[0])
}
