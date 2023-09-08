//
//  TxSenderView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-31.
//

import SwiftUI

struct TxSenderView: View {
    @State var senderFname : String = ""
    @State var senderLname : String = ""
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        ZStack {
            cynWhite
            VStack {
                // MARK: Sender Information
                VStack(spacing: 5) {
                    HStack {
                        Text("Sender Firstname:")
                            .font(.footnote)
                            .textCase(.uppercase)
                            .foregroundColor(Color(uiColor: .darkGray))
                            .padding(.leading, 15)
                        
                        Spacer()
                    }
                    
                    TxCustomTextField(text: $senderFname, placeholder: Text(""))
                        .font(.subheadline)
                        .frame(width: screenWidth - 75, height: 45)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 1)
                        )
                    
                }
                .frame(width: screenWidth - 50, height: screenHeight / 3)
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(.white, lineWidth: 2.5)
                )
            }
        }
    }
}
