//
//  BalanceTop.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

struct CardFrontView: View {
    @State var accBalance : Double = 14198.18
    @State private var lastFourDigits : Int = 1762
    @State var accType : String = "Current"
    
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
                                Image("logo-trans")
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .clipShape(Circle())
                                    .frame(width: 30, height: 30)
                                
                                Spacer()
                                
                                Text("COYNITT")
                                    .font(.custom("Avenir", size: 16))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 10)
                            
                            Spacer()
                            
                            // MARK: Middle Section
                            VStack {
                                HStack {
                                    Text("Available Balance")
                                        .font(.custom("Avenir", size: 16))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("$\(accBalance, specifier: "%.2f")")
                                        .font(.custom("Avenir", size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                }
                                .padding(.horizontal, 5)
                            }
                        }
                            .padding(10))
            }
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
