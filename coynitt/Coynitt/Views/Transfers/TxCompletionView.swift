//
//  TxCompletionView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-11-05.
//

import SwiftUI

struct TxCompletionView: View {
    var body: some View {
        ZStack {
            cynWhite
            VStack {
                VStack {
                    Image("circle-check")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(cynWhite)
                        .padding(10)
                        .background(cynGreen)
                        .clipShape(Circle())
                    
                    Text("Success!")
                        .font(.custom("Avenir", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("Your transaction was completed successfully")
                        .font(.custom("Avenir", size: 12)).bold()
                        .foregroundColor(.black)
                }
                .padding(.top, 50)
                
                Spacer()
//                    .frame(height: 20)
                
                // MARK: "Close" button
                Button(action: {
                    
                },
                       label: {
                    Text("close")
                        .font(.custom("Avenir", size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(cynWhite)
                })
                .frame(width: 200, height: 50)
                .background(cynGreen)
                .clipShape(Capsule())
                
            }
            .frame(height: UIScreen.main.bounds.height / 1.25)
            .padding(.vertical, 30)
            
        }
        .ignoresSafeArea()
        .overlay(
            SuccessLottieView(name: "success", loopMode: .loop)
        )
    }
}
