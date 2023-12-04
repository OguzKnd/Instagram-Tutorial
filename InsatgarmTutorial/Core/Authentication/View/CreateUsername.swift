//
//  CreateUsername.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 30.11.2023.
//

import SwiftUI

struct CreateUsername: View {
    @Environment(\.dismiss) var dismiss // Back button is active
    @EnvironmentObject var viewModel:RegistrationViewModel

    var body: some View {
        VStack(spacing: 12) {
            Text("Create Username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Pick a username for your new account. You can always change it later")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Username", text: $viewModel.username)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreatePassword()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
                
            }

            .padding(.vertical)
            Spacer()
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss() // back button is active
                }
            }
        }
    }
}

#Preview {
    CreateUsername()
}
