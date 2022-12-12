//
//  PasscodeView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-04.
//

import UIKit
import SwiftUI
import Combine
import AlertToast
import LocalAuthentication

struct PasscodeView: View {
    @EnvironmentObject var appLockModel : AppLockViewModel
    @State var isAppLockEnabled = false
    
    @State var rowHeight = 80.0
    
    var body: some View {
        ZStack {
            cynWhite
            
            NavigationView {
                Form {
                    Section {
                        // MARK: Toggle Switch
                        VStack {
                            HStack {
                                Toggle("Turn Passcode On", isOn: $isAppLockEnabled) // <-- change code to use AppLockViewModel
                                    .font(.custom("Avenir", size: 15).bold())
                                    .foregroundColor(.black)
                            }.toggleStyle(SwitchToggleStyle(tint: cynGreen2))
                                .HapticFeedback()
                            //                                .onChange(of: appLockModel.isAppLockEnabled, perform: { value in
                            //                                    appLockModel.appLockStateChange(appLockState: value)
                            //                                })
                            
                            HStack {
                                Text("Secure your information from unauthorised users by enabling a passcode.")
                                    .lineLimit(nil)
                                    .font(.custom("Avenir", size: 10).bold())
                                    .foregroundColor(Color.black)
                                    .minimumScaleFactor(0.5)
                                
                                Spacer()
                            }
                        }
                        
                        // MARK: Change passcode
                        HStack {
                            Text("Change passcode")
                                .font(.custom("Avenir", size: 15).bold())
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Text("change")
                                    .font(.custom("Avenir", size: 10).bold())
                                    .foregroundColor(.black)
                                    .frame(width: 60, height: 20)
                                    .padding(2)
                                    .overlay(
                                        Capsule(style: .continuous)
                                            .stroke(.black, style: StrokeStyle(lineWidth: 1))
                                    )
                            })
                        }
                    }
                }
            }
        }
        .environment(\.defaultMinListRowHeight, rowHeight)
    }
}

struct PasscodeView_Previews: PreviewProvider {
    static var previews: some View {
        PasscodeView()
    }
}
