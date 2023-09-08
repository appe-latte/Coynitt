//
//  BalanceTop.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

struct CardFrontView: View {
    @State var accBalance : Double = 1498.18
    @State private var lastFourDigits : Int = 1762
    @State var accType : String = "Current"
    
    @State var cardWidth : CGFloat = 350
    @State var cardHeight : CGFloat = 225
    
    let width : CGFloat
    let height : CGFloat
    
    @State private var showCardDetailsSheet = false
    @State private var showPinNumberSheet = false
    
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
                            Rectangle()
                                .fill(cynOlive)
                                .frame(width: 90, height: cardHeight)
                                .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                            
                            Spacer()
                        }
                        
                        VStack {
                            // MARK: Top Section
                            HStack {
                                Image("logo")
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .clipShape(Circle())
                                    .frame(width: 30, height: 30)
                                
                                Spacer()
                                
                                Text("COYNITT")
                                    .font(.headline)
                                    .bold()
                                    .kerning(2)
                                    .textCase(.uppercase)
                                    .foregroundColor(cynBlack)
                            }
                            .padding(15)
                            
                            Spacer()
                            
                            // MARK: Last Four Digits
                            VStack(spacing: 5) {
                                HStack {
                                    Image("card-chip")
                                        .resizable()
                                        .frame(width: 30, height: 25)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(cynWhite, lineWidth: 1))
                                    
                                    Spacer()
                                    
                                    Text("···· ···· ····")
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .kerning(3)
                                        .textCase(.uppercase)
                                        .foregroundColor(.black)
                                    
                                    Text("\(String(lastFourDigits))")
                                        .font(.custom("Impact", size: 18))
                                        .kerning(3)
                                        .textCase(.uppercase)
                                        .foregroundColor(.black)
                                }
                                .padding(.trailing, 20)
                                .padding(.bottom, 10)
                                
                                HStack {
                                    
                                    // MARK: Display Card Details
                                    VStack {
                                        Button(action: {
                                            showCardDetailsSheet.toggle()
                                        }, label: {
                                            Image("c-card")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(cynWhite)
                                                .padding(5)
                                                .background(cynOlive)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(cynWhite, lineWidth: 1))
                                        })
                                        
                                        Text("Details")
                                            .font(.system(size: 6))
                                            .fontWeight(.medium)
                                            .kerning(2)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynWhite)
                                    }
                                    
                                    // MARK: Pin Reminder
                                    VStack {
                                        Button(action: {
                                            showPinNumberSheet.toggle()
                                        }, label: {
                                            Image("lock")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(cynWhite)
                                                .padding(5)
                                                .background(cynOlive)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(cynWhite, lineWidth: 1))
                                        })
                                        
                                        Text("Pin")
                                            .font(.system(size: 6))
                                            .fontWeight(.medium)
                                            .kerning(2)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynWhite)
                                    }
                                    
                                    Spacer()
                                        .frame(width: 50)
                                    
                                    // MARK: Account Balance
                                    VStack {
                                        HStack {
                                            Text("$\(accBalance, specifier: "%.2f")")
                                                .font(.custom("Impact", size: 24))
                                                .textCase(.uppercase)
                                                .kerning(3)
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text("Available Balance")
                                                .font(.system(size: 7))
                                                .fontWeight(.semibold)
                                                .kerning(3)
                                                .textCase(.uppercase)
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                    }
                                }
                            }
                            .padding(15)
                        }
                    }
                )
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(cynWhite, lineWidth: 1))
        }
        .blurredSheet(.init(.ultraThinMaterial), show: $showCardDetailsSheet) {
            //
        } content: {
            CardDetailsView()
                .presentationDetents([.large, .fraction(0.8)])
                .ignoresSafeArea()
        }
        .blurredSheet(.init(.ultraThinMaterial), show: $showPinNumberSheet) {
            //
        } content: {
            PinReminderView()
                .presentationDetents([.medium, .fraction(0.45)])
                .ignoresSafeArea()
        }
    }
}
