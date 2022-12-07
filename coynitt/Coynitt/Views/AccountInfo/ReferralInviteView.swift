//
//  ReferralInviteView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-06.
//

import SwiftUI

struct ReferralInviteView: View {
    @State private var refCode: String = "KICYN"
    @State private var copyText: String = "Copy"
    
    private let pasteboard = UIPasteboard.general
    
    
    var body: some View {
        
        
        ZStack {
            cynWhite
            VStack(alignment: .center, spacing: 20) {
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
                    .stroke(cynGreen2, style: StrokeStyle(lineWidth: 0.5, dash: [10, 5])))
                
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
                    .frame(height: 20)
                
               
                
                Spacer()
                
            }
            .padding(.top, 35)
            
            Spacer()
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

struct ReferralInviteView_Previews: PreviewProvider {
    static var previews: some View {
        ReferralInviteView()
    }
}
