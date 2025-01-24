//
//  LoadingView.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 1/23/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(3)
    }
}

#Preview {
    LoadingView()
}
