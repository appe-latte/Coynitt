//
//  PinReminderView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-12.
//

import SwiftUI

struct PinReminderView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        let screenWeight = UIScreen.main.bounds.width
        
        ZStack {
            cynWhite
            VStack(alignment: .center) {
                // MARK: Pin Code Text
                HStack(spacing: 10) {
                    Text("5")
                        .font(.largeTitle).bold()
                        .foregroundColor(cynGreen2)
                        .frame(width: 50, height: 75)
                        .background(cynGreen.opacity(0.2))
                        .clipShape(RoundedCorner())
                        .padding(5)
                    
                    Text("1")
                        .font(.largeTitle).bold()
                        .foregroundColor(cynGreen2)
                        .frame(width: 50, height: 75)
                        .background(cynGreen.opacity(0.2))
                        .clipShape(RoundedCorner())
                        .padding(5)
                    
                    Text("9")
                        .font(.largeTitle).bold()
                        .foregroundColor(cynGreen2)
                        .frame(width: 50, height: 75)
                        .background(cynGreen.opacity(0.2))
                        .clipShape(RoundedCorner())
                        .padding(5)
                    
                    Text("8")
                        .font(.largeTitle).bold()
                        .foregroundColor(cynGreen2)
                        .frame(width: 50, height: 75)
                        .background(cynGreen.opacity(0.2))
                        .clipShape(RoundedCorner())
                        .padding(5)
                }
                
                VStack(spacing: 5) {
                    Text("This is your current PIN number.")
                        .fontWeight(.semibold)
                    
                    Text("This PIN number can be changed at any ATM or within this app.")
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.5)
                }
                .font(.footnote)
                .foregroundColor(.black)
                .frame(width: screenWeight)
                .padding(10)
                
                
                Spacer()
                    .frame(height: 100)
                
                
                VStack(spacing: 1) {
                    // MARK: "Dismiss" button
                    Button("Memorised") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .frame(width: 250, height: 60)
                    .background(cynGreen)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    
                    // MARK: "Upgrade" button
                    Button(action: {}, label: {
                        Text("Having an issue with your PIN?")
                            .font(.system(size: 13))
                            .fontWeight(.semibold)
                            .frame(width: 250, height: 60)
                            .foregroundColor(.blue)
                    })
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
