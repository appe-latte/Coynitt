//
//  BiometricView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-04.
//

import UIKit
import SwiftUI
import Combine
import AlertToast
import LocalAuthentication

struct BiometricView: View {
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
                                Toggle("Use Biometric Authentication", isOn: $isAppLockEnabled) // <-- change code to use AppLockViewModel
                                    .font(.custom("Avenir", size: 15).bold())
                                    .foregroundColor(.black)
                            }.toggleStyle(SwitchToggleStyle(tint: cynGreen2))
                            //                                .onChange(of: appLockModel.isAppLockEnabled, perform: { value in
                            //                                    appLockModel.appLockStateChange(appLockState: value)
                            //                                })
                            
                            HStack {
                                Text("Biometric authentication (FaceID) works when passcode security has been granted on your device.")
                                    .lineLimit(nil)
                                    .font(.custom("Avenir", size: 10).bold())
                                    .foregroundColor(Color.black)
                                    .minimumScaleFactor(0.5)
                                
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
        .environment(\.defaultMinListRowHeight, rowHeight)
    }
}

struct BiometricView_Previews: PreviewProvider {
    static var previews: some View {
        BiometricView()
    }
}
