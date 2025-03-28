//
//  CustomTextField.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-13.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text : String
    let placeholder : Text
    let imageName : String
    
    var body: some View {
        ZStack {
            if text.isEmpty {
                placeholder
                    .foregroundColor(.black)
                    .padding(.leading, 40)
                    .font(.footnote)
            }
            
            HStack(spacing: 15) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(cynGreen2)
                    .padding(.leading, 10)
                
                TextField("", text: $text)
                    .font(.footnote)
            }
        }
    }
}

struct TxCustomTextField: View {
    @Binding var text : String
    let placeholder : Text
    
    var body: some View {
        ZStack {
            if text.isEmpty {
                placeholder
                    .font(.subheadline)
                    .foregroundColor(Color(uiColor: .lightGray))
                    .padding(.leading, 10)
                
                Spacer()
            }
            
            HStack {
                TextField("", text: $text)
                    .font(.subheadline)
                    .padding(.leading, 10)
            }
        }
    }
}
