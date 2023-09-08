//
//  CardCvcSheetView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-14.
//

import SwiftUI

struct CardCvcView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var cvc : Int = 162
    @State private var expiryDate = "03/25"
    
    var body: some View {
        let screenWeight = UIScreen.main.bounds.width
        
        ZStack {
            VStack(alignment: .center) {
                // MARK: "Dismiss" button
                HStack {
                    Text("CVC / Card Expiry")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                .padding(15)
                
                HStack(spacing: 5) {
                    
                    // MARK: CVC Number
                    
                    Text("CVC:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 75, height: 50)
                        .padding(5)
                    
                    Text("\(cvc)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(cynGreen2)
                        .frame(width: 75, height: 50)
                        .background(cynGreen.opacity(0.2))
                        .clipShape(RoundedCorner(radius: 10))
                        .padding(5)
                    
                    // MARK: Card Expiry
                    
                    Text("Expiry:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 75, height: 50)
                        .padding(5)
                    
                    Text("\(expiryDate)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(cynGreen2)
                        .frame(width: 75, height: 50)
                        .background(cynGreen.opacity(0.2))
                        .clipShape(RoundedCorner(radius: 10))
                        .padding(5)
                }
                .frame(width: screenWeight - 20, height: 65)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
