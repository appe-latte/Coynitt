//
//  PinReminderView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-12.
//

import SwiftUI

struct PinReminderView: View {
    @State private var userPin : Int = 5198
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        let screenWeight = UIScreen.main.bounds.width
        
        ZStack {
            VStack(alignment: .center) {
                Rectangle()
                    .fill(Color(red: 47 / 255, green: 107 / 255, blue: 97 / 255))
                    .frame(width: UIScreen.main.bounds.width, height: 45)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            HStack {
                                Text("Pin Reminder")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(cynWhite)
                                    .textCase(.uppercase)
                                    .kerning(2)
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                        })
                
                Spacer()
                    .frame(height: 30)
                
                // MARK: Pin Code Text
                RoundedRectangle(cornerRadius: 15)
                    .fill(cynOlive)
                    .frame(width: 150, height: 75, alignment: .center)
                    .shadow(color: cynBlack, radius: 0.1, x: 4, y: 4)
                    .overlay {
                        Text("\(String(userPin))")
                            .font(.custom("Impact", size: 40))
                            .fontWeight(.heavy)
                            .foregroundColor(cynWhite)
                            .padding(.vertical, 5)
                            .padding(.leading, 15)
                            .kerning(10)
                    }
                
                VStack(spacing: 5) {
                    Text("This is your current PIN number.")
                        .font(.system(size: 13))
                        .fontWeight(.semibold)
                        .kerning(2)
                        .textCase(.uppercase)
                        .foregroundColor(cynBlack)
                    
                    
                    Text("This PIN number can be changed at any ATM or within this app.")
                        .font(.system(size: 7))
                        .fontWeight(.medium)
                        .kerning(2)
                        .textCase(.uppercase)
                        .foregroundColor(cynBlack)
                    
                }
                .font(.footnote)
                .foregroundColor(.black)
                .frame(width: screenWeight)
                .padding(10)
                
                Spacer()
                    .frame(height: 30)
                
                // MARK: "Dismiss" button
                VStack(spacing: 10) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Dismiss")
                            .fontWeight(.semibold)
                            .frame(width: 250, height: 60)
                            .background(cynOlive)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .foregroundColor(cynWhite)
                            .textCase(.uppercase)
                            .kerning(2)
                    })
                    .shadow(color: cynBlack, radius: 0.1, x: 4, y: 4)
                    
                    Button(action: {}, label: {
                        Text("Having an issue with your PIN?")
                            .font(.system(size: 10))
                            .fontWeight(.medium)
                            .kerning(2)
                            .textCase(.uppercase)
                            .foregroundColor(.blue)
                    })
                }
                
                Spacer()
            }
            .frame(width: screenWeight - 20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
