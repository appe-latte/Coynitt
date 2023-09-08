//
//  TxMainView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-19.
//

import SwiftUI
import UIKit

struct MainTransferView: View {
    @State var selectedCountry: String = ""
    @State var recipFullName : String = ""
    @State var txRecvAmount : Double = 0.00
    @State var txSendAmount : Double = 0.00
    @State var txTotalAmount : Double = 0.00
    @State var txRate : Double = 17.69
    @State var txFee : Double = 3.25
    @State var txRateCountry : String = "ZAR"
    @State var arrivalTime : String = "20"
    
    @State private var showKeypadSheet = false
    @State var showDepositActiveSheet = false
    @State var depositActivitySheet: DepositActivitySheet?
    
    @FocusState private var focusItem: Bool
    
    @State private var showCountryTxSheet = false
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        ZStack {
            cynWhite // Background color
            VStack(spacing: 5) {
                HStack {
                    Text("Send Funds")
                        .font(.system(size: 10))
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .kerning(2)
                }
                .frame(width: screenWidth * 0.95, alignment: .leading)
                
                HStack {
                    // MARK: "Send Money"
                    Button(action: {
                        showCountryTxSheet.toggle()
                    }, label: {
                        VStack(spacing: 5) {
                            Image("")
                            
                            Text("Send")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .textCase(.uppercase)
                                .kerning(2)
                            
                            Text("Money")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .textCase(.uppercase)
                                .kerning(2)
                        }
                    })
                    .frame(width: 100, height: 100)
                    .background(cynGreen2)
                    .foregroundColor(cynWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
                    // MARK: "Show Current Exchange Rates"
                    Button(action: {
                        //
                        //
                    }, label: {
                        VStack(spacing: 5) {
                            Image("")
                            
                            Text("Exchange")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .textCase(.uppercase)
                                .kerning(2)
                            
                            Text("Rates")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .textCase(.uppercase)
                                .kerning(2)
                        }
                    })
                    .frame(width: 100, height: 100)
                    .background(cynGreen2)
                    .foregroundColor(cynWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
                    // MARK: ---------
                    Button(action: {
                        //
                        //
                    }, label: {
                        VStack(spacing: 5) {
                            Image("")
                            
                            Text("______")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .textCase(.uppercase)
                                .kerning(2)
                            
                            Text("_____")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .textCase(.uppercase)
                                .kerning(2)
                        }
                    })
                    .frame(width: 100, height: 100)
                    .background(cynGreen2)
                    .foregroundColor(cynWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                }
                .frame(width: screenWidth * 0.95, alignment: .trailing)
                
                HStack {
                    Text("Recent Transactions")
                        .font(.system(size: 10))
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .kerning(2)
                }
                .frame(width: screenWidth * 0.95, alignment: .leading)
                
                Spacer()
            }
            .padding()
            .accentColor(.black)
            .onTapGesture{
                focusItem = false
            }
        }
        .blurredSheet(.init(.ultraThinMaterial), show: $showCountryTxSheet) { // <---- Blurred Sheet "Transfers"
            //
        } content: {
            PaymentsView()
                .presentationDetents([.medium, .fraction(0.5)])
                .ignoresSafeArea()
        }
    }
}

struct MainTransferView_Previews : PreviewProvider {
    static var previews: some View {
        MainTransferView()
    }
}
