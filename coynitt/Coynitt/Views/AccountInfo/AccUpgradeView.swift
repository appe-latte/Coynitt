//
//  UpgradeAccountView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-06.
//

import SwiftUI

struct AccUpgradeView: View {
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        
        @State var cardWidth : CGFloat = 300
        @State var cardHeight : CGFloat = 180
        
        ZStack {
            VStack {
                Rectangle()
                    .fill(Color(red: 47 / 255, green: 107 / 255, blue: 97 / 255))
                    .frame(width: UIScreen.main.bounds.width, height: 45)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            HStack {
                                Text("Upgrade Your Account")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(cynWhite)
                                    .textCase(.uppercase)
                                    .kerning(2)
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                        })
                
                // MARK: Mock Card
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
                                        .fontWeight(.heavy)
                                        .kerning(2)
                                        .textCase(.uppercase)
                                        .foregroundColor(cynBlack)
                                }
                                .padding(15)
                                
                                Spacer()
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Text("YOUR NAME HERE")
                                            .font(.footnote)
                                            .fontWeight(.medium)
                                            .kerning(2)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynBlack)
                                            .padding(10)
                                    }
                                }
                            }
                        }
                    )
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(cynWhite, lineWidth: 1))
                    .padding(.top, 10)
                
                Spacer()
                    .frame(height: 25)
                
                Text("Your Coynitt Card")
                    .font(.title)
                    .fontWeight(.heavy)
                    .kerning(2)
                    .textCase(.uppercase)
                    .foregroundColor(cynBlack)
                    .minimumScaleFactor(0.5)
                
                Text("The digital world in your wallet")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .kerning(2)
                    .textCase(.uppercase)
                    .foregroundColor(cynOlive)
                    .minimumScaleFactor(0.5)
                
                Spacer()
                    .frame(height: 10)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    // MARK: ATM withdrawal
                    HStack {
                        Image("withdraw")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(10)
                            .foregroundColor(cynWhite)
                            .background(cynOlive)
                            .clipShape(Circle())
                            .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                        
                        VStack(alignment: .leading) {
                            Text("Withdraw Cash")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .kerning(2)
                                .textCase(.uppercase)
                                .foregroundColor(cynBlack)
                            
                            Text("Use your card to withdraw cash from any supported ATM machines.")
                                .font(.system(size: 8))
                                .kerning(2)
                                .textCase(.uppercase)
                                .foregroundColor(cynBlack)
                                .multilineTextAlignment(.leading)
                        }
                        
                        Spacer()
                    }
                    .frame(width: screenWidth - 20, height: 60)
                    .padding(.horizontal, 15)
                    
                    // MARK: Shop online
                    HStack {
                        Image("store")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(10)
                            .foregroundColor(cynWhite)
                            .background(cynOlive)
                            .clipShape(Circle())
                            .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                        
                        VStack(alignment: .leading) {
                            Text("Shop Online")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .kerning(2)
                                .textCase(.uppercase)
                                .foregroundColor(cynBlack)
                            
                            Text("Use your card to make purchases from your favourite online stores or marketplaces.")
                                .font(.system(size: 8))
                                .kerning(2)
                                .textCase(.uppercase)
                                .foregroundColor(cynBlack)
                                .multilineTextAlignment(.leading)
                        }
                        
                        Spacer()
                    }
                    .frame(width: screenWidth - 20, height: 60)
                    .padding(.horizontal, 15)
                    
                    // MARK: Global Use
                    HStack {
                        Image("earth")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(10)
                            .foregroundColor(cynWhite)
                            .background(cynOlive)
                            .clipShape(Circle())
                            .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                        
                        VStack(alignment: .leading) {
                            Text("Travel Money")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .kerning(2)
                                .textCase(.uppercase)
                                .foregroundColor(cynBlack)
                            
                            Text("Take your card with you when you travel around the world.")
                                .font(.system(size: 8))
                                .kerning(2)
                                .textCase(.uppercase)
                                .foregroundColor(cynBlack)
                                .multilineTextAlignment(.leading)
                        }
                        
                        Spacer()
                    }
                    .frame(width: screenWidth - 20, height: 60)
                    .padding(.horizontal, 15)
                    
                    // MARK: Expenses
                    HStack {
                        Image("graph-2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(10)
                            .foregroundColor(cynWhite)
                            .background(cynOlive)
                            .clipShape(Circle())
                            .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                        
                        VStack(alignment: .leading) {
                            Text("Manage Expenses")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .kerning(2)
                                .textCase(.uppercase)
                                .foregroundColor(cynBlack)
                            
                            Text("Take your card with you when you travel around the world.")
                                .font(.system(size: 8))
                                .kerning(2)
                                .textCase(.uppercase)
                                .foregroundColor(cynBlack)
                                .multilineTextAlignment(.leading)
                        }
                        
                        Spacer()
                    }
                    .frame(width: screenWidth - 20, height: 60)
                    .padding(.horizontal, 15)
                }
                .frame(width: screenWidth * 0.9)
                .padding(.horizontal, 10)
                
                Spacer()
                    .frame(height: 50)
                
                // MARK: "Upgrade" button
                Button(action: {
                    
                }, label: {
                    Text("Upgrade Today")
                        .fontWeight(.semibold)
                        .frame(width: 250, height: 60)
                        .background(cynOlive)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .foregroundColor(cynWhite)
                        .textCase(.uppercase)
                        .kerning(2)
                })
                .shadow(color: cynBlack, radius: 0.1, x: 4, y: 4)
                
                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}
