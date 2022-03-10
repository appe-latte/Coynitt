//
//  BalanceTop.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

struct CardView: View {
    @State private var accBalance : Double = 14198.18
    @State private var lastFourDigits : Int = 1762
    
    var body: some View {
        GeometryReader { geo in
            Rectangle()
                .fill(cynGreen)
                .frame(width: 250, height: 150)
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
                        }
                        .padding(.horizontal, 10)
                        
                        Spacer()
                        
                        // MARK: Middle Section
                        HStack {
                            Text("$\(accBalance, specifier: "%.2f")")
                                .font(.custom("Avenir", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 10)
                        
                        HStack {
                            Text("DEBIT CARD")
                                .font(.custom("Avenir", size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("···· \(String(lastFourDigits))") // String() ~ removes comma from Int
                                .font(.custom("Avenir", size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                        }
                        .padding(.horizontal, 10)
                    }
                        .padding(10))
        }
    }
}

// MARK: Corner radius for "HeaderTop"
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
