//
//  SearchView.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 29.11.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user, label: {
                            HStack {
                                CircularProfileImageView(user: user, size: .xSmall)
                                
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                   
                                    if user.fullname != nil {
                                        Text(user.fullname!)
                                    }
                                    
                                }
                                .font(.footnote)
                                Spacer()
                            }
                        })
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText,prompt: "Search")
                
            }
            .navigationDestination(for: User.self, destination: { user in
                    ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
