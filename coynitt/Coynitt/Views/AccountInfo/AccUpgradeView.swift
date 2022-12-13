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
        
        ZStack {
            cynWhite
//            
            VStack {
                
                // MARK: Card Sample
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [cynGreen2, cynPurple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 325, height: 200)
                    .cornerRadius(15, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            // MARK: Mock Card sample
                            HStack {
                                Image("logo-trans")
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .clipShape(Circle())
                                    .frame(width: 50, height: 50)
                                
                                Spacer()
                                
                                Text("COYNITT")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(cynWhite)
                            }
                            .padding(.horizontal, 10)
                            
                            Spacer()
                            
                            VStack {
                                HStack {
                                    Spacer()
                                    
                                    Text("YOUR NAME HERE")
                                        .font(.footnote)
                                        .foregroundColor(cynWhite)
                                        .padding(.horizontal, 5)
                                        .padding(.bottom, 10)
                                }
                            }
                        }
                            .padding(10))
                
                Text("Your Coynitt Card")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .minimumScaleFactor(0.5)
                
                Text("The digital world in your wallet")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(cynGreen2)
                    .minimumScaleFactor(0.5)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    // MARK: ATM withdrawal
                    
                    HStack {
                        Image("withdraw")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(5)
                            .foregroundColor(.white)
                            .background(cynRed)
                            .clipShape(Circle())
                        
                        
                        VStack(alignment: .leading) {
                            Text("Withdraw Cash")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Text("Use your card to withdraw cash from any ATM machines that support MasterCard.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .frame(width: screenWidth, height: 60)
                    .padding(.horizontal, 20)
                    .padding(.leading, 10)
                    
                    // MARK: Shop online
                    HStack {
                        Image("store")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(5)
                            .foregroundColor(.white)
                            .background(cynOrange)
                            .clipShape(Circle())
                        
                        
                        VStack(alignment: .leading) {
                            Text("Shop Online")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Text("Use your card to make purchases from your favourite online stores or marketplaces.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .frame(width: screenWidth, height: 60)
                    .padding(.horizontal, 20)
                    .padding(.leading, 10)
                    
                    // MARK: Global Use
                    HStack {
                        Image("earth")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(5)
                            .foregroundColor(.white)
                            .background(cynPurple)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Travel Money")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Text("Take your card with you when you travel around the world.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .frame(width: screenWidth, height: 60)
                    .padding(.horizontal, 20)
                    
                    // MARK: Expenses
                    HStack {
                        Image("graph-2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(5)
                            .foregroundColor(.white)
                            .background(cynGreen2)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Manage Expenses")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Text("Take your card with you when you travel around the world.")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .frame(width: screenWidth, height: 60)
                    .padding(.horizontal, 20)
                }
                .frame(width: 300)
                .padding(.horizontal, 10)
                
                Spacer()
                    .frame(height: 50)
                
                // MARK: "Upgrade" button
                Button(action: {}, label: {
                    Text("Upgrade Today")
                        .fontWeight(.semibold)
                        .frame(width: 250, height: 60)
                        .background(cynGreen)
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                })
            }
            .padding(.horizontal, 20)
        }
        
        Spacer()
    }
}

struct UpgradeAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccUpgradeView()
    }
}
