//
//  KesExchangeView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 13/08/2022.
//

import SwiftUI

struct KesExchangeView : View {
    @State private var kesSendFigure : Float = 0.00
    @State private var liveKESrate : Float = 119.25
    @State private var arrivalDate = "30 minutes"
    
    @State var rowHeight = 35.0
    
    var body: some View {
        
        ZStack {
            // MARK: Conversion rates
            let rate_1 = kesSendFigure * 0.025
            let rate_2 = kesSendFigure * 0.005
            let rate_3 = kesSendFigure * 0.0035
            
            // MARK: Tx + rate
            let totalPay_1 = kesSendFigure + rate_1
            let totalPay_2 = kesSendFigure + rate_2
            let totalPay_3 = kesSendFigure + rate_3
            
            // MARK: Recvr Amount
            let kesRecvFigure = (liveKESrate * kesSendFigure)
            
            Form {
                Section {
                    // MARK: "Sending" amount
                    HStack {
                        Text("Sending:")
                            .font(.custom("Avenir", size: 13))
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                        
                        Image("united-states")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        TextField("0.00", value: $kesSendFigure, format: .number)
                            .font(.custom("Avenir", size: 16))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .foregroundColor(.black)
                    }
                    
                    // MARK: Conversion + Fee rates
                    HStack {
                        Text("Our Fee:")
                            .font(.custom("Avenir", size: 11))
                        if (kesSendFigure <= 100) {
                            Text("\(Float(rate_1), specifier: "%.2f")")
                                .font(.custom("Avenir", size: 11))
                                .foregroundColor(.blue)
                                .bold()
                        } else if (kesSendFigure > 100 && kesSendFigure < 500) {
                            Text("\(Float(rate_2), specifier: "%.2f")")
                                .font(.custom("Avenir", size: 11))
                                .foregroundColor(.blue)
                                .bold()
                        } else if (kesSendFigure > 500) {
                            Text("\(Float(rate_3), specifier: "%.2f")")
                                .font(.custom("Avenir", size: 11))
                                .foregroundColor(.blue)
                                .bold()
                        }
                        
                        Spacer()
                    }.padding(.leading, 5)
                    
                    // MARK: Total Payment
                    if (kesSendFigure <= 100) {
                        HStack {
                            Text("You pay:")
                                .font(.custom("Avenir", size: 11))
                            Text("$\(totalPay_1, specifier: "%.2f")")
                                .font(.custom("Avenir", size: 11))
                                .foregroundColor(.blue)
                                .bold()
                            
                            Spacer()
                        }.padding(.leading, 5)
                    } else if (kesSendFigure > 100 && kesSendFigure < 500) {
                        HStack {
                            Text("You pay:")
                                .font(.custom("Avenir", size: 11))
                            Text("$\(totalPay_2, specifier: "%.2f")")
                                .font(.custom("Avenir", size: 11))
                                .foregroundColor(.blue)
                                .bold()
                            
                            Spacer()
                        }.padding(.leading, 5)
                    } else {
                        HStack {
                            Text("You pay:")
                                .font(.custom("Avenir", size: 11))
                            Text("$\(totalPay_3, specifier: "%.2f")")
                                .font(.custom("Avenir", size: 11))
                                .foregroundColor(.blue)
                                .bold()
                            
                            Spacer()
                        }.padding(.leading, 5)
                    }
                    
                    // MARK: "Received" amount
                    HStack {
                        Text("Receiving:")
                            .font(.custom("Avenir", size: 13))
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                        
                        Image("kenya")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text("$\(Float(kesRecvFigure), specifier: "%.2f")")
                            .font(.custom("Avenir", size: 16))
                            .bold()
                        
                        Spacer()
                        
                        HStack {
                            Text("Expected:")
                                .font(.custom("Avenir", size: 7))
                                .foregroundColor(.black)
                            Text(arrivalDate)
                                .font(.custom("Avenir", size: 7))
                                .foregroundColor(.blue)
                                .bold()
                        }
                    }
                    
                    // MARK: Expected Tx time
                    HStack {
                        Spacer()
                        
                        HStack {
                            Text("Powered by:")
                                .font(.custom("Avenir", size: 9))
                                .foregroundColor(.black)
                            
                            Image("wu")
                                .resizable()
                                .frame(width: 75, height: 70)
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .environment(\.defaultMinListRowHeight, rowHeight)
        }
    }
}
