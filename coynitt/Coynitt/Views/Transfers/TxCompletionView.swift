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
            cynGreen
            VStack {
                VStack {
                    Image("circle-check")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(cynGreen)
                        .padding(10)
                        .background(cynWhite)
                        .clipShape(Circle())
                    
                    Text("Success!")
                        .font(.custom("Avenir", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Your transaction was completed successfully")
                        .font(.custom("Avenir", size: 12))
                        .foregroundColor(.white)
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
                        .foregroundColor(cynGreen)
                })
                .frame(width: 200, height: 50)
                .background(cynWhite)
                .clipShape(Capsule())
                
            }
            .frame(height: UIScreen.main.bounds.height / 1.25)
            .padding(.vertical, 30)
        }.ignoresSafeArea()
    }
}

struct TxCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        TxCompletionView()
    }
}
