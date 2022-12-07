//
//  UpgradeAccountView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-06.
//

import SwiftUI

struct AccUpgradeView: View {
    var body: some View {
        ZStack {
            cynWhite
            VStack {
                
            
                // MARK: Card Demo
                
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [cynGreen2, cynGreen]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 200)
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
                               
                            }
                        }
                            .padding(10))
                
            }
        }
    }
}

struct UpgradeAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccUpgradeView()
    }
}
