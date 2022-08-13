//
//  CardBackView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import SwiftUI

struct CardBackView: View {
    @State private var firstFourDigits : Int = 2536
    @State private var secondFourDigits : Int = 5291
    @State private var thirdFourDigits : Int = 1809
    @State private var lastFourDigits : Int = 1762
    @State private var cvv : Int = 162
    @State private var expiryDate = "03/25"
    @State private var fullName : String = "Samuel Jameson"
    
    @State var cardWidth : CGFloat = 250.0
    @State var cardHeight : CGFloat = 150
    
    @State var isSecured: Bool = true
    
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
                                
                                Spacer()
                                
                                Text("Debit")
                                    .font(.custom("Avenir", size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .textCase(.uppercase)
                            }
                            .padding(.horizontal, 10)
                            .padding(.top, 10)
                            
                            Rectangle()
                                .frame(width: cardWidth, height: 20)
                                .background(.black).opacity(0.1)
                                .overlay(
                                    HStack {
                                        if isSecured {
                                            Text("**** **** **** \(String(lastFourDigits))")
                                                .font(.custom("Avenir", size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                                .padding(.leading, 5)
                                        } else {
                                            Text("\(String(firstFourDigits)) " + "\(String(secondFourDigits)) " + "\(String(thirdFourDigits)) " + "\(String(lastFourDigits))")
                                                .font(.custom("Avenir", size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                                .padding(.leading, 5)
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            self.isSecured.toggle()
                                        }, label: {
                                            if isSecured == true {
                                                Image(systemName: "eye.fill")
                                                    .resizable()
                                                    .frame(width: 20, height: 14)
                                                    .foregroundColor(cynWhite)
                                                    .padding(2)
                                            } else {
                                                Image(systemName: "eye.slash.fill")
                                                    .resizable()
                                                    .frame(width: 20, height: 14)
                                                    .foregroundColor(cynWhite)
                                                    .padding(2)
                                            }
                                        })
                                    }
                                        .padding(.horizontal, 5)
                                )
                            
                            // MARK: Middle Section
                            HStack {
                                Text("\(String(expiryDate))") // String() ~ removes comma from Int
                                    .font(.custom("Avenir", size: 12))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                if isSecured {
                                    Text("***")
                                        .font(.custom("Avenir", size: 12))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                } else {
                                    Text("\(String(cvv))")
                                        .font(.custom("Avenir", size: 12))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal, 5)
                            .padding(.top, 10)
                            
                            Spacer()
                            
                            HStack {
                                Text("\(fullName)")
                                    .font(.custom("Avenir", size: 12))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .textCase(.uppercase)
                                
                                Spacer()
                                
                                Image("master-card")
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width: 40, height: 40)
                            }
                            .padding(.horizontal, 5)
                        }
                            .padding(10))
            }
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}



