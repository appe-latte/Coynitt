//
//  LoginView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-13.
//

import os
import Combine
import SwiftUI
import AlertToast
import FirebaseAuth
import CountryPicker

struct LoginView: View {
    @State private var isLoggedIn : Bool = false
    @State var showPwdResetSheet : Bool = false
    @State var showSignUpSheet : Bool = false
    
    // MARK: OTP
    @State var showOtpSheet : Bool = false
    @State var cellNum : String = ""
    @State private var verificationID : String = ""
    @State var showProgressView : Bool = false
    
    // MARK: CountryPicker
    @State private var country : Country?
    @State private var showCountryPicker : Bool = false
    
    // MARK: Alert Toast
    @State private var showAlert : Bool = false
    @State private var errTitle : String = ""
    @State private var errMessage : String = ""
    
    // MARK: Objects
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        
        ZStack {
            cynWhite
            VStack(alignment: .center, spacing: 10) {
                
                HStack {
                    Text("Validate Number")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                .padding(.top, 15)
                .padding(.horizontal, 15)
                
                // MARK: Phone Number Entry
                HStack(spacing: 10) {
                    Button {
                        self.showCountryPicker = true
                    } label: {
                        Text(country != nil ? "\(country!.isoCode.getFlag()) + \(country!.phoneCode)" : "\("CA".getFlag()) +1")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .sheet(isPresented: $showCountryPicker) {
                        CountryPickerView(country: $country)
                    }
                    .frame(width: 65, height: 30)
                    .foregroundColor(.black)
                    .padding(.leading, 10)
                    
                    TextField("Enter cell no.", text: $cellNum)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .keyboardType(.numberPad)
                }
                .padding(5)
                .foregroundColor(.black)
                .frame(width: screenWidth - 50, height: 50)
                .padding(.leading, 5)
                .background(cynGreen2.opacity(0.2))
                .clipShape(Capsule())
                
                Spacer()
                
                if self.showProgressView {
                    VStack {
                        ProgressView()
                            .frame(width: 50, height: 60)
                            .progressViewStyle(CircularProgressViewStyle(tint: cynGreen2))
                            .scaleEffect(2)
                        
                        Text("Please Wait...")
                            .font(.footnote)
                            .foregroundColor(cynGreen2)
                    }
                    .frame(width: 75, height: 100)
                    .background(cynWhite)
                    .clipShape(RoundedCorner(radius: 10))
                }
                
                Spacer()
                
                // MARK: "Verify / Login" button
                Button("Verify"){
                    self.showProgressView = true
                    self.sendOtp()
                }
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width: 200, height: 60)
                .background(cynGreen)
                .clipShape(Capsule())
                .foregroundColor(.white)
                .disabled((cellNum != "") ? false : true)
                .opacity((cellNum != "") ? 1 : 0.5)
//                .alert(isPresented: $viewModel.isError, content: {
//                    Alert(title: Text("Login Error"), message: Text(viewModel.errorMsg).environmentObject(self.viewModel) as? Text)
//                })
                .sheet(isPresented: $showOtpSheet, onDismiss: {
                    if viewModel.userSession != nil {
                        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
                    } else {
                        self.showProgressView = false
                    }
                })
                {
                    PhoneOtpView(verificationID: $verificationID).environmentObject(self.viewModel)
                }
            }
            .toast(isPresenting: $showAlert) {
                AlertToast(displayMode: .alert, type: .error(cynRed), title: Optional(errTitle), subTitle: Optional(errMessage))
            }
        }
        .accentColor(cynGreen2)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
    }
    // MARK: "Send OTP" method
    
    func sendOtp() {
        var countryCode = "+1"
        if country != nil {
            countryCode = "+ \(country!.phoneCode)"
        }
        
        let phoneNum = "\(countryCode)\(cellNum)"
        
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNum, uiDelegate: nil) {
                verificationID, error in
                if let error = error {
                    print("Phone Authentication Error :: \(error.localizedDescription)")
                    self.errTitle = "Error"
                    self.errMessage = "\(error.localizedDescription)"
                    self.showAlert = true
                    return
                }
                
                if let mVerificationID =
                    verificationID {
                    print(mVerificationID)
                    self.verificationID = mVerificationID
                    self.showOtpSheet = true
                }
            }
    }
}
