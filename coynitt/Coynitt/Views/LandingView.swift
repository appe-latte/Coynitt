//
//  LandingView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-21.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        ZStack {
            cynOlive
            VStack(alignment: .center, spacing: 5) {
                LandingLottieView(name: "landing-logo", loopMode: .repeat(7))
                    .frame(width: 200, height: 200)
                
                Text("coynitt")
                    .font(.system(size: 64, weight: .bold))
                    .foregroundColor(cynBlack)
                    .textCase(.uppercase)
                    .kerning(3)
                    .minimumScaleFactor(0.5)
                
                Text("Banking without borders. Your world! Your Wallet")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(cynBlack)
                    .textCase(.uppercase)
                    .kerning(2)
                    .minimumScaleFactor(0.5)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
