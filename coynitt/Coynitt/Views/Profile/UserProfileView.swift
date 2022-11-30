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
                    .fill(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
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
                            .padding(20)
                        })
                
                Spacer()
                
                Text("Displays User Profile")
                
            }
        }
    }
}
