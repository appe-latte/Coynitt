//
//  CardView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-10-11.
//

import SwiftUI
import AlertToast
import PassKit

struct AccountView: View {
    @State var firstName : String = "Samuel"
    @State private var userHandle : String = "samthing90"
    @State private var accountNumber : Int = 1001773
    
    @State var rowHeight = 65.0 // sets row height for list
    @State private var showAccountDetailsSheetView = false
    @State private var showDepositSheetView = false
    @State var showAccFreezeAlert = false
    @State var showTransferActiveSheet = false
    @State var isTransferActiveSheetPresented = false
    @State private var showAlert = false
    
    // MARK: "Add Funds"
    @State var showDepositActiveSheet = false
    @State var depositActivitySheet: DepositActivitySheet?
    
    // MARK: Apple Pay
    let paymentHandler = PaymentHandler()
    
    // MARK: Bottom Sheets
    @State private var showQrSheet = false
    @State private var showCountryTxSheet = false
    @State private var showBillPaySheet = false
    @State private var showReferSheet = false
    @State private var showAccUpgradeSheet = false
    @State private var showPinReminderSheet = false
    @State private var showCardDetailsSheet = false
    
    // MARK: Card Rotate
    @State var rotationAngleBack = 0.0
    @State var rotationAngleFront = -90.0
    @State var isCardFlipped = false
    
    let width : CGFloat = 200
    let height : CGFloat = 250
    let animationDelay : CGFloat = 0.3
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ZStack {
                cynOlive
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
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
                                        .background(cynRed)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(cynWhite, lineWidth: 1))
                                        .actionSheet(isPresented: $showDepositActiveSheet) {
                                            ActionSheet(title: Text("Add Funds"), message: Text("How would you like to deposit the funds?"), buttons: [
                                                .default(Text("Apple Pay")){
                                                    depositActivitySheet = .appl_pay
                                                    //
                                                    paymentHandler.startPayment { (success) in
                                                        if success {
                                                            print("Success")
                                                        } else {
                                                            print("Failed")
                                                        }
                                                    }
                                                },
                                                .default(Text("Debit / Credit card")){
                                                    depositActivitySheet = .debit_card
                                                },
                                                .default(Text("Bank Transfer")){
                                                    depositActivitySheet = .bank_tx
                                                },
                                                .cancel()
                                            ])
                                        }
                                        
                                        Text("Add Funds")
                                            .font(.system(size: 8))
                                            .foregroundColor(cynBlack)
                                            .textCase(.uppercase)
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
                                        
                                        Text("Transfer")
                                            .font(.system(size: 8))
                                            .foregroundColor(cynBlack)
                                            .textCase(.uppercase)
                                            .padding(.vertical, 2)
                                    }
                                    .padding(.bottom, 10)
                                    
                                    // MARK: "Rounds" button
                                    VStack(spacing: 5) {
                                        NavigationLink(
                                            destination: MainRoundsView()){
                                                Image("rounds")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundColor(cynWhite)
                                            }
                                            .frame(width: 50, height: 50)
                                            .background(cynPurple)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                            .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(cynWhite, lineWidth: 1))
                                        
                                        Text("Rounds")
                                            .font(.system(size: 8))
                                            .foregroundColor(cynBlack)
                                            .textCase(.uppercase)
                                            .padding(.vertical, 2)
                                    }
                                    .padding(.bottom, 10)
                                    
                                    // MARK: "Bills" button
                                    VStack(spacing: 5) {
                                        Button(action: {showBillPaySheet.toggle()}, label: {
                                            Image("house-bill")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(cynWhite)
                                        })
                                        .frame(width: 50, height: 50)
                                        .background(cynOlive)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(cynWhite, lineWidth: 1))
                                        
                                        Text("Bills")
                                            .font(.system(size: 8))
                                            .foregroundColor(cynBlack)
                                            .textCase(.uppercase)
                                            .padding(.vertical, 2)
                                    }
                                    .padding(.bottom, 10)
                                    .sheet(isPresented: $showBillPaySheet) {
                                        ZStack {
                                            cynWhite
                                            
                                            BillPayView()
                                        }
                                        .ignoresSafeArea()
                                        .presentationDetents([.medium, .fraction(0.75)])
                                    }
                                    
                                    // MARK: "Upgrade" button
                                    VStack(spacing: 5) {
                                        Button(action: {showAccUpgradeSheet.toggle()}, label: {
                                            Image("star")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(cynWhite)
                                        })
                                        .frame(width: 50, height: 50)
                                        .background(cynOrange)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(cynWhite, lineWidth: 1))
                                        
                                        Text("Upgrade")
                                            .font(.system(size: 8))
                                            .foregroundColor(cynBlack)
                                            .textCase(.uppercase)
                                            .padding(.vertical, 2)
                                    }
                                    .padding(.bottom, 10)
                                    .blurredSheet(.init(.ultraThinMaterial), show: $showAccUpgradeSheet) {
                                        //
                                    } content: {
                                        AccUpgradeView()
                                            .ignoresSafeArea()
                                            .presentationDetents([.large, .fraction(0.95)])
                                    }
                                }
                                .padding(.top, 20)
                            })
                    
                    Spacer()
                    
                    // MARK: Card View
                    ZStack {
                        CardFrontView(width: width, height: height)
                    }
                    .frame(width: screenWidth, height: 160)
                    
                    Spacer()
                    
                    // MARK: Account Information
                    //                        VStack {
                    //                            Button(action: {
                    //                                self.showAccountDetailsSheetView.toggle()
                    //                            }, label: {
                    //                                Image(systemName: "info.circle.fill")
                    //                                    .resizable()
                    //                                    .frame(width: 25, height: 25)
                    //                                    .padding(10)
                    //                                    .background(cynWhite.opacity(0.1))
                    //                                    .clipShape(Circle())
                    //                            })
                    //
                    //                            // MARK: Freeze Account
                    //                            Button(action: {
                    //                                self.showAccFreezeAlert.toggle()
                    //                            }, label: {
                    //                                Image(systemName: "snowflake.circle")
                    //                                    .resizable()
                    //                                    .frame(width: 25, height: 25)
                    //                                    .padding(10)
                    //                                    .background(cynWhite.opacity(0.1))
                    //                                    .clipShape(Circle())
                    //                            })
                    //                            .alert(isPresented: $showAccFreezeAlert) {
                    //                                Alert(
                    //                                    title: Text("Freeze Your Account"),
                    //                                    message: Text("Use this feature to temporarily block your account if your card is lost/stolen."),
                    //                                    primaryButton: .destructive(Text("Freeze")) {
                    //
                    //                                    },
                    //                                    secondaryButton: .cancel()
                    //                                )
                    //                            }
                    //
                    //                            Spacer()
                    //                        }
                    //                        .frame(height: 150)
                    //                        .padding(.leading, 10)
                    //                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        // MARK: Rewards
                        VStack(spacing: 10) {
                            Rectangle()
                                .fill(cynOlive)
                                .frame(height: 50)
                                .cornerRadius(20, corners: [.topRight, .topLeft])
                                .overlay {
                                    ZStack {
                                        VStack {
                                            HStack {
                                                Text("Special Offer 🎉🎉🎊")
                                                    .font(.system(size: 17))
                                                    .fontWeight(.heavy)
                                                    .foregroundColor(cynWhite)
                                                    .textCase(.uppercase)
                                                    .kerning(3)
                                                
                                                Spacer()
                                            }
                                            .padding(10)
                                        }
                                    }
                                }
                            
                            HStack(spacing: 10) {
                                Image("check")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(cynOlive)
                                
                                Text("First transfer is ....")
                                    .font(.system(size: 13))
                                    .fontWeight(.medium)
                                    .foregroundColor(cynBlack)
                                    .textCase(.uppercase)
                                
                                Spacer()
                            }
                            .padding()
                            
                            Spacer()
                            
                        }
                        .frame(width: screenWidth * 0.8, height: screenHeight * 0.25)
                        .background(cynWhite)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .black, radius: 0.1, x: 4, y: 4)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(cynWhite, lineWidth: 1))
                        .padding(5)
                    }
                    .frame(width: screenWidth)
                    .padding(.top, 20)
                    
                    
                    VStack(spacing: 10) {
                        Image("cdic-logo")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 2)
                        
                        Text("All customer deposits are monitored and protected by the CDIC.")
                            .font(.system(size: 8))
                            .fontWeight(.medium)
                            .textCase(.uppercase)
                            .kerning(2)
                            .padding(2)
                    }
                    .frame(width: screenWidth * 0.8)
                    .foregroundColor(cynWhite)
                    
                    Spacer()
                }
            }
            .sheet(isPresented: $showPinReminderSheet) {
                PinReminderView()
                    .presentationDetents([.medium, .fraction(0.40)])
                    .ignoresSafeArea()
            }
            .navigationBarTitleDisplayMode(.inline)
            .environment(\.defaultMinListRowHeight, rowHeight)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack {
                        Text("Coynitt")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(cynBlack)
                            .textCase(.uppercase)
                            .kerning(5)
                        
                        Text("Acc: \(String(accountNumber))")
                            .font(.system(size: 10))
                            .foregroundColor(cynBlack)
                            .textCase(.uppercase)
                            .kerning(2)
                    }
                }
                
                // MARK: "Referral" button
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button(action: {
                        showReferSheet.toggle()
                    }, label: {
                        VStack {
                            Image("ticket")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(cynBlack)
                                .clipShape(Circle())
                            
                            Text("Refer A Friend")
                                .font(.system(size: 8))
                                .foregroundColor(cynBlack)
                                .textCase(.uppercase)
                                .kerning(2)
                        }
                    })
                    .blurredSheet(.init(.ultraThinMaterial), show: $showReferSheet) {
                        //
                    } content: {
                        ReferralInviteView()
                            .ignoresSafeArea()
                            .presentationDetents([.large, .fraction(0.95)])
                    }
                }
            }
        }
        .accentColor(cynWhite)
    }
}

struct AccountView_previews : PreviewProvider {
    static var previews : some View {
        AccountView()
    }
}
