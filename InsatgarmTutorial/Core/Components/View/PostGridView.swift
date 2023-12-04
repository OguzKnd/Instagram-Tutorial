//
//  PostGridView.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 1.12.2023.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
        @StateObject var viewModel: PostGridViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1

    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
 

    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
        
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                       .resizable()
                       .scaledToFill()
                       .frame(width: imageDimension, height: imageDimension)
                       .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(user: User.MOCK_USER[0])
}
