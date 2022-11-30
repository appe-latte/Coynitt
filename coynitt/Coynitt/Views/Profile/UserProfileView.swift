//
//  UserProfileView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 13/04/2022.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ZStack {
            cynWhite
            VStack {
                Rectangle()
                    .fill(Color(red: 177 / 255, green: 156 / 255, blue: 217 / 255))
                    .frame(width: UIScreen.main.bounds.width, height: 45)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            HStack {
                                Text("User Profile")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(cynWhite)
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                        })
                
                Spacer()
                
                Text("Displays User Profile")
                
                Spacer()
                
            }
        }
    }
}
