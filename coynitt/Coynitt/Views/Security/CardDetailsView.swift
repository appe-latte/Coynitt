//
//  CardDetailsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-14.
//

import SwiftUI

struct CardDetailsView: View {
    // MARK: Card Number
    @State private var firstFourDigits : Int = 2536
    @State private var secondFourDigits : Int = 5291
    @State private var thirdFourDigits : Int = 1809
    @State private var lastFourDigits : Int = 1762
    
    @Environment(\.dismiss) var dismiss
    
    @State private var cvv : Int = 162
    @State private var expiryDate = "03/25"
    
    let width : CGFloat = 200
    let height : CGFloat = 250
    let animationDelay : CGFloat = 0.3
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        ZStack {
            cynWhite
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 15) {
                Rectangle()
                    .fill(Color(red: 47 / 255, green: 107 / 255, blue: 97 / 255))
                    .frame(width: UIScreen.main.bounds.width, height: 45)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            HStack {
                                Text("Card Details")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(cynWhite)
                                    .textCase(.uppercase)
                                    .kerning(2)
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                        })
                
                Spacer()
                    .frame(height: 20)
                
                // MARK: Card Details
                VStack {
                    CardBackView(width: screenWidth, height: screenHeight)
                }
                .frame(width: 320, height: screenWidth / 3)
                .padding(.vertical, 10)
                
                Text("* Do NOT share this information with anyone and maintain it's privacy at all times.")
                    .font(.system(size: 7))
                    .fontWeight(.semibold)
                    .kerning(2)
                    .textCase(.uppercase)
                    .foregroundColor(cynBlack)
                    .padding(10)
                    .padding(.top, 5)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
