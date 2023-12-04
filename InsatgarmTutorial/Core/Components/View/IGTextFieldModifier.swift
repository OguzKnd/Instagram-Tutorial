//
//  IGTextFieldModifier.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 30.11.2023.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
