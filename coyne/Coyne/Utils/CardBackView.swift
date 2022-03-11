//
//  CardBackView.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import SwiftUI

struct CardBackView: View {
    @State private var accBalance : Double = 14198.18
    @State private var lastFourDigits : Int = 1762
    @State private var cvv : Int = 162
    @State private var expiryDate = "03/25"
    @State private var fullName : String = "S Jameson"
    @State var cardWidth : CGFloat = 250.0
    @State var cardHeight : CGFloat = 150
    
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [cynGreen2, cynGreen]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: cardWidth, height: cardHeight)
                    .cornerRadius(15, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            // MARK: Top Section
                            HStack {
                                Image("master-card")
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width: 40, height: 40)
                                
                                Spacer()
                                
                                Text("DEBIT CARD")
                                    .font(.custom("Avenir", size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 10)
                            
                            Rectangle()
                                .frame(width: cardWidth, height: 20)
                                .background(.black).opacity(0.1)
                                .overlay(
                                    HStack {
                                        Text("**** **** **** \(String(lastFourDigits))")
                                            .font(.custom("Avenir", size: 14))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        
                                        Spacer()
                                        
                                        Button(action: {}, label: {
                                            Image(systemName: "eye")
                                                .resizable()
                                                .frame(width: 20, height: 15)
                                                .foregroundColor(cynWhite)
                                                .padding(2)
                                        })
                                    }
                                        .padding(.horizontal, 5)
                                )
                            
                            // MARK: Middle Section
                            HStack {
                                Text("CVV: \(String(cvv))")
                                    .font(.custom("Avenir", size: 12))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text("Expiry: \(String(expiryDate))") // String() ~ removes comma from Int
                                    .font(.custom("Avenir", size: 12))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 10)
                            
                            Spacer()
                            
                            HStack {
                                Text("\(fullName)")
                                    .font(.custom("Avenir", size: 14))
                                    .bold()
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 10)
                        }
                            .padding(10))
            }
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}



