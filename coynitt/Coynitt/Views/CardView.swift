//
//  CardView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-10-11.
//

import SwiftUI

struct CardView: View {
    @State private var accNum : Int = 373812093
    @State var fName : String = "Samuel"
    @State private var userTag : String = "samthing90"
    
    @State var rowHeight = 65.0 // sets row height for list
    @State private var showAccountDetailsSheetView = false
    @State private var showDepositSheetView = false
    @State var showAccFreezeAlert = false
    @State var showTransferActiveSheet = false
    @State var isTransferActiveSheetPresented = false
    @State var showDepositActiveSheet = false
    //    @State var transferActivitySheet: TransfersActivitySheet?
    @State var depositActivitySheet: DepositActivitySheet?
    //    @State var actionViewMode = TransfersActivitySheet.bank_tx
    @State private var showQrSheet = false
    
    // MARK: Card Rotate
    @State var rotationAngleBack = 0.0
    @State var rotationAngleFront = -90.0
    @State var isCardFlipped = false
    
    let width : CGFloat = 200
    let height : CGFloat = 250
    let animationDelay : CGFloat = 0.3
    
    //MARK: Flip Card Function
    func cardAnimation() {
        isCardFlipped = !isCardFlipped
        if isCardFlipped {
            withAnimation(.linear(duration: animationDelay)) {
                rotationAngleBack = 90
            }
            withAnimation(.linear(duration: animationDelay).delay(animationDelay)){
                rotationAngleFront = 0
            }
        } else {
            withAnimation(.linear(duration: animationDelay)) {
                rotationAngleFront = -90
            }
            withAnimation(.linear(duration: animationDelay).delay(animationDelay)){
                rotationAngleBack = 0
            }
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                cynWhite
                VStack {
                    Rectangle()
                        .fill(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                        .frame(width: UIScreen.main.bounds.width, height: 110)
                        .edgesIgnoringSafeArea(.all)
                        .overlay(
                            VStack {
                                HStack {
                                    
                                    Spacer()
                                    
                                    // MARK: Send Funds View
                                    NavigationLink(
                                        destination: PaymentsView()){
                                            HStack {
                                                Image("send")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .frame(width: 25, height: 25)
                                                    .foregroundColor(.white)
                                                Text("Transfer")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.semibold)
                                            }
                                            .frame(width: 120, height: 50)
                                            .background(cynRed)
                                            .clipShape(Capsule())
                                        }
                                    
                                    // MARK: Withdraw Funds View
                                    NavigationLink(
                                        destination: PaymentsView()){
                                            HStack {
                                                Image("send")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .frame(width: 25, height: 25)
                                                    .foregroundColor(.white)
                                                    .rotationEffect(Angle(degrees: -45))
                                                Text("Withdraw")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.semibold)
                                            }
                                            .frame(width: 120, height: 50)
                                            .background(cynGreen2)
                                            .clipShape(Capsule())
                                        }
                                    
                                    // MARK: "Rounds" View
                                    NavigationLink(
                                        destination: SavingsPotsView()){
                                            HStack {
                                                Image("rounds")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .frame(width: 30, height: 30)
                                                    .foregroundColor(.white)
                                                Text("Rounds")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.semibold)
                                            }
                                            .frame(width: 120, height: 50)
                                            .background(cynPurple)
                                            .clipShape(Capsule())
                                        }
                                }
                                .padding(20)
                            })
                    
                    // MARK: Card Views
                    HStack {
                        ZStack {
                            CardFrontView(width: width, height: height, degree: $rotationAngleBack)
                            CardBackView(width: width, height: height, degree: $rotationAngleFront)
                        }
                        .frame(width: 260, height: 160)
                        
                        // MARK: Account Information
                        VStack {
                            Button(action: {
                                self.showAccountDetailsSheetView.toggle()
                            }, label: {
                                Image(systemName: "info.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(cynGreen.opacity(0.1))
                                    .clipShape(Circle())
                            })
                            
                            // MARK: Flip Card
                            Button(action: {
                                self.cardAnimation()
                            }, label: {
                                VStack {
                                    if isCardFlipped == true {
                                        Image(systemName: "creditcard.fill")
                                            .resizable()
                                            .frame(width: 25, height: 20)
                                            .padding(10)
                                            .background(cynGreen.opacity(0.1))
                                            .clipShape(Circle())
                                    } else {
                                        Image(systemName: "creditcard.and.123")
                                            .resizable()
                                            .frame(width: 25, height: 20)
                                            .padding(10)
                                            .background(cynGreen.opacity(0.1))
                                            .clipShape(Circle())
                                    }
                                }
                            }).onTapGesture {
                                cardAnimation()
                            }
                            
                            // MARK: Freeze Account
                            Button(action: {
                                self.showAccFreezeAlert.toggle()
                            }, label: {
                                Image(systemName: "snowflake.circle")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(cynGreen.opacity(0.1))
                                    .clipShape(Circle())
                            }).alert(isPresented: $showAccFreezeAlert) {
                                Alert(
                                    title: Text("Freeze Your Account"),
                                    message: Text("Use this feature to temporarily block your account if your card is lost/stolen."),
                                    primaryButton: .destructive(Text("Freeze")) {
                                        
                                    },
                                    secondaryButton: .cancel()
                                )
                            }
                            
                            Spacer()
                        }
                        .frame(height: 150)
                        .padding(.trailing, 5)
                    }
                    
                    Spacer()
                    
//                  MARK: Information
                    VStack {
                        Form {
                            Section {
                                // MARK: Upgrade
                                NavigationLink(destination: PaymentsView()){
                                    Image("star")
                                        .resizable()
                                        .renderingMode(.template)
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.yellow)
                                    VStack {
                                        HStack {
                                            Text("Upgrade Account")
                                                .font(.custom("Avenir", size: 15).bold())
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text("Upgrade your account and receive a physical debit card")
                                                .font(.custom("Avenir", size: 10).bold())
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                    }
                                }
                                
                                // MARK: Invite
                                NavigationLink(destination: PaymentsView()){
                                    Image("ticket")
                                        .resizable()
                                        .renderingMode(.template)
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.red)
                                    VStack {
                                        HStack {
                                            Text("Refer A Friend")
                                                .font(.custom("Avenir", size: 15).bold())
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text("Earn money when you refer a friend")
                                                .font(.custom("Avenir", size: 10).bold())
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                    }
                                }
                                
                                // MARK: Instagram
                                VStack(spacing: 10) {
                                    HStack {
                                        Image("instagram")
                                            .resizable()
                                            .frame(width: 34, height: 34)
                                        Link("Follow Us on Instagram", destination: URL(string: "https://www.instagram.com/coynitt")!)
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(Color(red: 83 / 255, green: 82 / 255, blue: 116 / 255))
                                    }
                                }
                                
                                // MARK: Facebook
                                VStack(spacing: 10) {
                                    HStack {
                                        Image("facebook")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                        Link("Follow Us on Facebook", destination: URL(string: "https://www.instagram.com/coynitt")!)
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(Color(red: 83 / 255, green: 82 / 255, blue: 116 / 255))
                                    }
                                }
                                
                                // MARK: TikTok
                                VStack(spacing: 10) {
                                    HStack {
                                        Image("tiktok")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                        Link("Follow Us on TikTok", destination: URL(string: "https://www.tiktok.com/@appe.latte")!)
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(Color(red: 83 / 255, green: 82 / 255, blue: 116 / 255))
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showAccountDetailsSheetView) {
                AccountDetailsView()
            }
            .sheet(isPresented: $showDepositSheetView) {
                AccountDepositView()
            }
            .accentColor(cynGreen)
            .navigationBarTitleDisplayMode(.inline)
            .environment(\.defaultMinListRowHeight, rowHeight)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack {
                        Text("Coynitt")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(cynWhite)
                            .textCase(.uppercase)
                        
                        Text("@\(String(userTag))")
                            .font(.system(size: 10))
                            .foregroundColor(cynWhite)
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    // MARK: How-to Button
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image("how-to")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(cynWhite)
                                .clipShape(Circle())
                            
                            Text("How-To")
                                .font(.system(size: 10))
                                .foregroundColor(cynWhite)
                        }
                    })
                    
                    // MARK: Help Button
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image("question")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(cynWhite)
                                .clipShape(Circle())
                            
                            Text("Help")
                                .font(.system(size: 10))
                                .foregroundColor(cynWhite)
                        }
                    })
                }
            }
        }.accentColor(cynWhite)
    }
}
