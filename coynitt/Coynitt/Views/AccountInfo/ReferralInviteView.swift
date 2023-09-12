//
//  ReferralInviteView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-06.
//

import SwiftUI

struct ReferralInviteView: View {
    @State private var refCode: String = "KIPCYN/135"
    @State private var copyText: String = "Copy"
    
    private let pasteboard = UIPasteboard.general
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Rectangle()
                    .fill(Color(red: 47 / 255, green: 107 / 255, blue: 97 / 255))
                    .frame(width: UIScreen.main.bounds.width, height: 45)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            HStack {
                                Text("Refer A Friend")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(cynWhite)
                                    .textCase(.uppercase)
                                    .kerning(2)
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                        })
                
                // MARK: Promo image
                VStack {
                    Image("promo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text("Refer a friend")
                        .font(.custom("Avenir", size: 40).bold())
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.5)
                    
                    Text("Earn money when your friends successfully register using your referral code.")
                        .font(.custom("Avenir", size: 12).bold())
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal, 5)
                }
                
                // MARK: Referral Code
                HStack(spacing: 100) {
                    Text(refCode)
                        .font(.custom("Avenir", size: 25).bold())
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.5)
                    
                    // MARK: "copy" button
                    
                    Button {
                        copyToClipboard()
                    } label: {
                        Label(copyText, image: "copy")
                    }.tint(.black)
                    
                }
                .frame(width: 300, height: 60)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, style: StrokeStyle(lineWidth: 0.5, dash: [10, 5])))
                
                // MARK: Requirements
                
                VStack(alignment: .leading, spacing: 10) {
                    // 1.
                    Text("1. Complete registration including KYC verification.")
                        .font(.custom("Avenir", size: 15).bold())
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.5)
                    
                    Text("2. Complete your first transfer.")
                        .font(.custom("Avenir", size: 15).bold())
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.5)
                    
                    Text("3. Invite your relatives / friends to join Coynitt using your Referral Code above.")
                        .font(.custom("Avenir", size: 16).bold())
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.5)
                    
                    Text("4. Upon their first successful transaction you will both receive USD $10 into your accounts.")
                        .font(.custom("Avenir", size: 15).bold())
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.5)
                }.padding(.horizontal, 20)
                
                Spacer()
                
                // MARK: "Terms" button
                Button(action: {}, label: {
                    Text("View our Terms and Conditions")
                        .font(.system(size: 13))
                        .fontWeight(.semibold)
                        .frame(width: 250, height: 60)
                        .foregroundColor(.blue)
                })
                
                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .top)
//            .padding(.all)

        }
    }
    
    // MARK: "Copy" function
    func copyToClipboard() {
        pasteboard.string = self.refCode
        self.copyText = "Copied!"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.copyText = "Copy"
        }
    }
}
