//
//  CardBackView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import SwiftUI

struct CardBackView: View {
    @State private var setOne : Int = 2536
    @State private var setTwo : Int = 5291
    @State private var setThree : Int = 1809
    @State private var setFour : Int = 1762
    @State private var cvv : Int = 162
    @State private var expiryDate = "03/25"
    @State private var fullName : String = "Samuel Jameson"
    
    @State var cardWidth : CGFloat = 325
    @State var cardHeight : CGFloat = 200
    
    @State var isSecured: Bool = true
    
    let width : CGFloat
    let height : CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(cynWhite)
                .frame(width: cardWidth, height: cardHeight)
                .shadow(color: .black, radius: 0.1, x: 4, y: 4)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    ZStack {
                        HStack {
                            Spacer()
                            
                            Rectangle()
                                .fill(cynOlive)
                                .frame(width: 90, height: cardHeight)
                                .cornerRadius(20, corners: [.topRight, .bottomRight])
                        }
                        
                        VStack {
                            // MARK: Top Section
                            HStack {
                                
                                Spacer()
                                
                                Text("Debit")
                                    .font(.headline)
                                    .bold()
                                    .kerning(2)
                                    .textCase(.uppercase)
                                    .foregroundColor(cynWhite)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 20)
                            
                            Rectangle()
                                .fill(cynBlack.opacity(0.1))
                                .frame(width: cardWidth, height: 40)
                                .overlay(
                                    HStack {
                                        if isSecured {
                                            Text("**** **** **** \(String(setFour))")
                                                .font(.headline)
                                                .fontWeight(.heavy)
                                                .kerning(2)
                                                .textCase(.uppercase)
                                                .foregroundColor(cynOlive)
                                                .padding(.leading, 5)
                                        } else {
                                            Text("\(String(setOne)) " + "\(String(setTwo)) " + "\(String(setThree)) " + "\(String(setFour))")
                                                .font(.headline)
                                                .fontWeight(.heavy)
                                                .kerning(2)
                                                .textCase(.uppercase)
                                                .foregroundColor(cynOlive)
                                                .padding(.leading, 5)
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            self.isSecured.toggle()
                                        }, label: {
                                            if isSecured == true {
                                                Image(systemName: "eye.fill")
                                                    .resizable()
                                                    .frame(width: 30, height: 20)
                                                    .foregroundColor(cynWhite)
                                                    .padding(2)
                                            } else {
                                                Image(systemName: "eye.slash.fill")
                                                    .resizable()
                                                    .frame(width: 30, height: 20)
                                                    .foregroundColor(cynWhite)
                                                    .padding(2)
                                            }
                                        })
                                    }
                                        .padding(.horizontal, 5)
                                )
                            
                            // MARK: Middle Section
                            HStack {
                                Text("Expiry: \(String(expiryDate))") // String() ~ removes comma from Int
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .kerning(2)
                                    .textCase(.uppercase)
                                    .foregroundColor(cynBlack)
                                
                                Spacer()
                                
                                if isSecured {
                                    Text("CVV: ***")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .kerning(2)
                                        .textCase(.uppercase)
                                        .foregroundColor(cynWhite)
                                        .padding(2)
                                } else {
                                    Text("CVV: \(String(cvv))")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .kerning(2)
                                        .textCase(.uppercase)
                                        .foregroundColor(cynWhite)
                                        .padding(2)
                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.top, 10)
                            
                            Spacer()
                            
                            HStack {
                                Text("\(fullName)")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .kerning(2)
                                    .textCase(.uppercase)
                                    .foregroundColor(cynBlack)
                                
                                Spacer()
                                
                                Image("visa-logo")
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                                    .frame(width: 45, height: 40)
                                    .padding(5)
                                    .foregroundColor(cynWhite)
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                )
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(cynBlack, lineWidth: 1))
        }
    }
}
