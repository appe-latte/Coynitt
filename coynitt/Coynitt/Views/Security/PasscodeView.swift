//
//  PasscodeView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-12.
//

import SwiftUI
import AlertToast

public struct PasscodeView: View {
    
    @Environment(\.dismiss) var dismiss
    //    @ObservedObject var viewModel: ContentView.ViewModel
    
    private let maxDigits: Int = 6
    private let userPasscode = "123456"
    
    @State var enteredPasscode: String = ""
    @FocusState var keyboardFocused: Bool
    
    @State private var showAlert = false
    @State private var alertMessage = "Passcode is wrong, try again!"
    
    public var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        ZStack {
            cynWhite
            
            VStack(spacing: 20) {
                Text("Enter passcode to unlock")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                HStack(spacing: 10) {
                    ForEach(0 ..< maxDigits) {
                        ($0 + 1) > enteredPasscode.count ?
                        Image(systemName: "circle") :
                        Image(systemName: "circle.fill")
                    }
                    .foregroundColor(cynGreen2)
                    .font(.system(size: 35))
                }
//                .alert("Incorrect passcode", isPresented: $showAlert) {
//                    Button("OK", role: .cancel) { }
//                }
                .toast(isPresenting: $showAlert){
                    AlertToast(type: .error(cynRed), title: "Wrong Passcode")
                                }
   
                TextField("Enter your passcode", text: $enteredPasscode)
                    .opacity(0)
                    .keyboardType(.decimalPad)
                    .focused($keyboardFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            keyboardFocused = true
                        }
                    }
                
                Spacer()
                    .frame(height: 150)
            }
            .padding()
            .onChange(of: enteredPasscode) { _ in
                guard enteredPasscode.count == maxDigits else { return }
                
                passcodeValidation()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func passcodeValidation() {
        if enteredPasscode == userPasscode {
            //            viewModel.isUnlocked = true
            dismiss()
        } else {
            enteredPasscode = ""
            showAlert = true
        }
    }
}
