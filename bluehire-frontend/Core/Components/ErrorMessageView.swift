//
//  ErrorMessageView.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 1/23/25.
//

import SwiftUI

struct ErrorMessageView: View {
    var message: String
    
    var body: some View {
        Text(message)
            .foregroundColor(.red)
    }
}

#Preview {
    ErrorMessageView(message: "Example of error message")
}
