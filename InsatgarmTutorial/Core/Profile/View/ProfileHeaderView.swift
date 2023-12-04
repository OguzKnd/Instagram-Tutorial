//
//  ProfileHeaderView.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 1.12.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user:User
    @State private var showEditProfile = false
    
    
    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack{
                
                CircularProfileImageView(user: user, size: .large)
                
                Spacer()
                
                HStack(spacing: 8){
                    
                    UserStatView.init(value: 3, title: "Posts")
                    UserStatView.init(value: 265, title: "Followers")
                    UserStatView.init(value: 325, title: "Following")

                }
            }
            
            .padding(.horizontal)
            
            // Name and bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                    
            
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("Follow..")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(user.isCurrentUser ? .black : .clear, lineWidth: 1))
            }

        
            Divider()
        }
        
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
        
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER[0])
}
