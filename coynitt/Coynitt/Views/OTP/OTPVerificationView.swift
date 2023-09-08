//
//  OTPVerificationView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-30.
//

import SwiftUI

struct OTPVerificationView: View {
    var body: some View {
        ZStack {
            cynWhite
            VStack {
                Text("OTP Verification")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.all)
            .frame(maxWidth: .infinity, alignment: .top)
        }
    }
}
