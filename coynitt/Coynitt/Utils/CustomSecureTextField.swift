//
//  CustomSecureTextField.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-13.
//

import SwiftUI

struct CustomSecureTextField : View {
    @Binding var text : String
    let placeHolder : Text
    
    var body: some View {
        ZStack {
            if text.isEmpty {
                placeHolder
                    .foregroundColor(.black)
                    .padding(.leading, 40)
                    .font(.footnote)
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                
                SecureField("", text: $text)
                    .textContentType(.newPassword)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
        }
    }
}
