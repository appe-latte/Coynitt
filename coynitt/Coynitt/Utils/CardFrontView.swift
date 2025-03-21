//
//  BalanceTop.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

struct CardFrontView: View {
    @State var balance : Double = 1498.18
    @State private var setFour : Int = 1762
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
                .shadow(color: cynBlack, radius: 0.1, x: 4, y: 4)
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
                                        .foregroundColor(cynBlack)
                                    
                                    Text("\(String(setFour))")
                                        .font(.custom("Impact", size: 18))
                                        .kerning(3)
                                        .textCase(.uppercase)
                                        .foregroundColor(cynBlack)
                                }
                                .padding(.trailing, 20)
                                .padding(.bottom, 10)
                                
                                ZStack {
                                    HStack(spacing: 5) {
                                        Spacer()
                                            .frame(width: 80)
                                        
                                        // MARK: Show Pin and Card Details
                                        HStack {
                                            // MARK: Card Details
                                            Button(action: {
                                                showCardDetailsSheet.toggle()
                                            }, label: {
                                                VStack {
                                                    Image("c-card")
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                        .foregroundColor(cynWhite)
                                                        .padding(5)
                                                        .background(cynOlive)
                                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(cynWhite, lineWidth: 1))
                                                    
                                                    Text("Details")
                                                        .font(.system(size: 7))
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(cynBlack)
                                                        .textCase(.uppercase)
                                                }
                                            })
                                            
                                            // MARK: Pin Number
                                            Button(action: {
                                                showPinNumberSheet.toggle()
                                            }, label: {
                                                VStack {
                                                    Image("lock")
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                        .foregroundColor(cynWhite)
                                                        .padding(5)
                                                        .background(cynOlive)
                                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(cynWhite, lineWidth: 1))
                                                    
                                                    Text("PIN")
                                                        .font(.system(size: 7))
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(cynBlack)
                                                        .textCase(.uppercase)
                                                }
                                            })
                                        }
                                        
                                        Spacer()
                                        
                                        // MARK: Account Balance
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text("$\(balance, specifier: "%.2f")")
                                                    .font(.custom("Impact", size: 24))
                                                    .textCase(.uppercase)
                                                    .kerning(3)
                                                    .foregroundColor(cynBlack)
                                                
                                                Spacer()
                                            }
                                            
                                            Text("Available Balance")
                                                .font(.system(size: 7))
                                                .fontWeight(.semibold)
                                                .kerning(3)
                                                .textCase(.uppercase)
                                                .foregroundColor(cynBlack)
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
