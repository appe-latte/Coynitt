//
//  MainView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI
import UIKit
import CarBode
import Combine
import AlertToast
import PassKit

struct MainView: View {
    @State var userAccBal : Double = 1498.18
    @State var userFName : String = "Samuel"
    @State private var userTag : String = "samthing90"
    @State var txAmount : Double  = 0.00
    
    @State var rowHeight = 50.0 // sets row height for list
    @State var showQrSheet = false
    @State var showProfileSheet = false
    
    // MARK: "Add Funds"
    @State var showDepositActiveSheet = false
    @State var depositActivitySheet: DepositActivitySheet?
    
    // MARK: Apple Pay
    let paymentHandler = PaymentHandler()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    // MARK: Keyboard
    @State private var text: String = ""
    @FocusState private var showKeyboard: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                cynOlive
                    .ignoresSafeArea()
                
                VStack {
                    Rectangle()
                        .fill(cynWhite)
                        .cornerRadius(45, corners: [.bottomRight])
                        .frame(width: screenWidth, height: 110)
                        .overlay(
                            VStack {
                                HStack(spacing: 25) {
                                    // MARK: "Add Funds" button
                                    VStack {
                                        Button(action: {
                                            self.showDepositActiveSheet.toggle()
                                        }, label: {
                                            Image("add")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(cynWhite)
                                        })
                                        .frame(width: 50, height: 50)
                                        .background(cynApricot)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(cynWhite, lineWidth: 1))
                                        //                                        .actionSheet(isPresented: $showDepositActiveSheet) {
                                        //                                            ActionSheet(title: Text("Add Funds"), message: Text("How would you like to deposit the funds?"), buttons: [
                                        //                                                .default(Text("Apple Pay")){
                                        //                                                    depositActivitySheet = .appl_pay
                                        //                                                    //
                                        //                                                    paymentHandler.startPayment { (success) in
                                        //                                                        if success {
                                        //                                                            print("Success")
                                        //                                                        } else {
                                        //                                                            print("Failed")
                                        //                                                        }
                                        //                                                    }
                                        //                                                },
                                        //                                                .default(Text("Debit / Credit card")){
                                        //                                                    depositActivitySheet = .debit_card
                                        //                                                },
                                        //                                                .default(Text("Bank Transfer")){
                                        //                                                    depositActivitySheet = .bank_tx
                                        //                                                },
                                        //                                                .cancel()
                                        //                                            ])
                                        //                                        }
                                        
                                        VStack {
                                            Text("Recharge")
                                                .font(.system(size: 8))
                                                .foregroundColor(cynBlack)
                                                .textCase(.uppercase)
                                            
                                            Text("Airtime")
                                                .font(.system(size: 8))
                                                .foregroundColor(cynBlack)
                                                .textCase(.uppercase)
                                        }
                                        .padding(.vertical, 2)
                                    }
                                    .padding(.bottom, 10)
                                    
                                    // MARK: "Transfer Funds" button
                                    VStack(spacing: 5) {
                                        NavigationLink(
                                            destination: PaymentsView()){
                                                Image("send")
                                                    .resizable()
                                                    .frame(width: 25, height: 25)
                                                    .foregroundColor(cynWhite)
                                                    .rotationEffect(Angle(degrees: -45))
                                            }
                                            .frame(width: 50, height: 50)
                                            .background(cynGreen2)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                            .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(cynWhite, lineWidth: 1))
                                        
                                        VStack {
                                            Text("Transfer")
                                                .font(.system(size: 8))
                                                .foregroundColor(cynBlack)
                                                .textCase(.uppercase)
                                            
                                            Text("Funds")
                                                .font(.system(size: 8))
                                                .foregroundColor(cynBlack)
                                                .textCase(.uppercase)
                                        }
                                        .padding(.vertical, 2)
                                    }
                                    .padding(.bottom, 10)
                                    
                                    // MARK: QR Code Button
                                    VStack(spacing: 5) {
                                        Button(action: {
                                            showQrSheet.toggle()
                                        }, label: {
                                            Image(systemName: "qrcode")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(cynWhite)
                                        })
                                        .frame(width: 50, height: 50)
                                        .background(cynOlive)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(cynWhite, lineWidth: 1))
                                        
                                        VStack {
                                            Text("QR Code")
                                                .font(.system(size: 8))
                                                .foregroundColor(cynBlack)
                                                .textCase(.uppercase)
                                            
                                            Spacer()
                                        }
                                        .padding(.vertical, 2)
                                    }
                                    .padding(.bottom, 10)
                                    .sheet(isPresented: $showQrSheet) {
                                        ZStack {
                                            cynWhite
                                            
                                            QrCodeView()
                                        }
                                        .ignoresSafeArea()
                                        .presentationDetents([.medium, .fraction(0.5)])
                                        .HapticFeedback()
                                    }
                                    
                                    // MARK: "Available Balance"
                                    VStack {
                                        Text("Available Balance:")
                                            .font(.system(size: 8))
                                            .fontWeight(.semibold)
                                            .kerning(3)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynBlack)
                                        
                                        HStack {
                                            Image("canada")
                                                .resizable()
                                                .frame(width: 18, height: 18)
                                                .overlay(
                                                    Circle()
                                                        .stroke(cynBlack, lineWidth: 1)
                                                )
                                                .padding(5)
                                            
                                            
                                            Text("$\(userAccBal, specifier: "%.2f")")
                                                .font(.custom("Impact", size: 24))
                                                .textCase(.uppercase)
                                                .kerning(3)
                                                .foregroundColor(cynBlack)
                                        }
                                    }
                                    .frame(width: 160, height: 100)
                                }
                                .padding(.horizontal, 20)
                            }
                                .padding(.top, 20))
                    
                    // MARK: Keyboard + "Most Recent" Recipient
                    VStack {
                        // MARK: List of most recent recipients
                        
                        // MARK: Amount to send
                        TextField("$0.00", text: $text)
                            .font(.system(size: 50))
                            .fontWeight(.semibold)
                            .kerning(2)
                            .textCase(.uppercase)
                            .foregroundColor(cynWhite)
                            .multilineTextAlignment(.center)
                            .padding(10)
                        
                        // MARK: Keyboard View
                        CustomKeyboardView()
                    }
                    .frame(maxWidth: .infinity, maxHeight: screenHeight * 0.55)
                    
                    Spacer()
                }
            }
            .accentColor(cynWhite)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    HStack(spacing: 10) {
                        // MARK: User Profile View
                        Button(action: {
                            showProfileSheet.toggle()
                        }, label: {
                            Image("dummy-image")
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                                .frame(width: 35, height: 35)
                                .foregroundColor(cynGreen)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(cynOlive, lineWidth: 1)
                                )
                        }).sheet(isPresented: $showProfileSheet) {
                            ZStack {
                                cynWhite
                                
                                UserProfileView()
                            }
                            .ignoresSafeArea()
                            .presentationDetents([.large, .fraction(0.95)])
                        }
                        
                        VStack {
                            Text("Coynitt")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(cynBlack)
                                .textCase(.uppercase)
                                .kerning(5)
                            
                            HStack {
                                Text("Hi, \(userFName)")
                                    .font(.system(size: 10))
                                    .foregroundColor(cynBlack)
                                    .textCase(.uppercase)
                                    .kerning(2)
                                
                                Spacer()
                            }
                        }
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    // MARK: Notifications Button
                    Button(action: {
                        //
                    }, label: {
                        VStack {
                            Image("alert")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(cynBlack)
                                .clipShape(Circle())
                            
                            Text("Alerts")
                                .font(.system(size: 8))
                                .foregroundColor(cynBlack)
                                .textCase(.uppercase)
                                .kerning(2)
                        }
                    })
                }
            }
        }
        .accentColor(cynWhite)
        .onAppear()
    }
    
    // MARK: Custom Keyboard
    @ViewBuilder
    func CustomKeyboardView() -> some View {
        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 10), count: 3), spacing: 10) {
            ForEach(1...9, id: \.self) { index in
                KeyboardButtonView(.text("\(index)")) {
                    if text.isEmpty {
                        text.append("$")
                    }
                    
                    text.append("\(index)")
                }
            }
            
            // MARK: Delete last figure
            KeyboardButtonView(.image("delete-amount")) {
                if !text.isEmpty {
                    text.removeLast()
                    if text == "$" {
                        text = ""
                    }
                }
            }
            
            // MARK: "Zero"
            KeyboardButtonView(.text("0")) {
                if text.isEmpty {
                    text.append("$")
                }
                text.append("0")
            }
            
            // MARK: "Comma"
            KeyboardButtonView(.text(".")) {
                if text.isEmpty {
                    text.append("$")
                }
                text.append(".00")
            }
            
            // MARK: Transfer Amount + Most recent recipient -- Send Initiation
            //            KeyboardButtonView(.image("approve")) {
            //                //
            //                // <---- add logic for initiating send
            //                //
            //            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
        .background {
            Rectangle()
                .fill(cynOlive)
                .ignoresSafeArea()
        }
    }
    
    // MARK: Keyboard View
    @ViewBuilder
    func KeyboardButtonView(_ value: KeyboardValue, onTap: @escaping () -> ()) -> some View {
        Button(action: onTap) {
            ZStack {
                switch value {
                case .text(let string):
                    Text(string)
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .foregroundColor(cynWhite)
                    
                case .image(let image):
                    Image(image)
                        .font(image == "approve" ? .title : .title2)
                        .fontWeight(.semibold)
                        .foregroundColor(image == "approve" ? cynGreen2 : cynWhite)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .contentShape(Rectangle())
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: Keyboard enums
enum KeyboardValue {
    case text(String)
    case image(String)
}

// MARK: Deposit Activity Sheet enum
enum DepositActivitySheet: Identifiable {
    case appl_pay, bank_tx, debit_card
    
    var id: Int {
        hashValue
    }
}
