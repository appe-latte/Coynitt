//
//  zarExchangeView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 13/08/2022.
//

import SwiftUI

struct TxSouthAfricaView: View {
    
    @State private var zarSendFigure : Float = 0.00
    @State private var liveZARrate : Float = 16.196753
    @State private var arrivalDate = "1 hour"
    
    var body: some View {
        ZStack {
            VStack {
                // MARK: Transfer Amount
                VStack {
                    HStack {
                        Text("Sending:")
                            .font(.custom("Avenir", size: 13))
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                        
                        Image("united-states")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        TextField("0.00", value: $zarSendFigure, format: .number)
                            .font(.custom("Avenir", size: 16))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                }
                .frame(width: 275, height: 75)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 1)
                        .frame(width: 350))
                
                // MARK: Exchange Rate
                VStack {
                    HStack {
                        Text("Exchange Rate ~")
                            .font(.custom("Avenir", size: 13))
                        Text("1 : \(liveZARrate, specifier: "%.5f")")
                            .font(.custom("Avenir", size: 13))
                            .foregroundColor(.blue)
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.leading, 30)
                    
                    // MARK: Our Fee
                    let rate_1 = zarSendFigure * 0.025
                    let rate_2 = zarSendFigure * 0.005
                    let rate_3 = zarSendFigure * 0.0035
                    
                    HStack {
                        Text("Our Fee:")
                            .font(.custom("Avenir", size: 13))
                        if (zarSendFigure <= 100) {
                            Text("\(Float(rate_1), specifier: "%.2f")")
                                .font(.custom("Avenir", size: 13))
                                .foregroundColor(.blue)
                                .bold()
                        } else if (zarSendFigure > 100 && zarSendFigure < 500) {
                            Text("\(Float(rate_2), specifier: "%.2f")")
                                .font(.custom("Avenir", size: 13))
                                .foregroundColor(.blue)
                                .bold()
                        } else {
                            Text("\(Float(rate_3), specifier: "%.2f")")
                                .font(.custom("Avenir", size: 13))
                                .foregroundColor(.blue)
                                .bold()
                        }
                        
                        Spacer()
                    }
                    .padding(.leading, 30)
                    
                    let totalPay_1 = zarSendFigure + rate_1
                    let totalPay_2 = zarSendFigure + rate_2
                    let totalPay_3 = zarSendFigure + rate_3
                    
                    // MARK: Total Payment
                    if (zarSendFigure <= 100) {
                        HStack {
                            Text("You pay:")
                                .font(.custom("Avenir", size: 13))
                            Text("$\(totalPay_1, specifier: "%.2f")")
                                .font(.custom("Avenir", size: 13))
                                .foregroundColor(.blue)
                                .bold()
                            
                            Spacer()
                        }.padding(.leading, 30)
                    } else if (zarSendFigure > 100 && zarSendFigure < 500) {
                        HStack {
                            Text("You pay:")
                                .font(.custom("Avenir", size: 13))
                            Text("$\(totalPay_2, specifier: "%.2f")")
                                .font(.custom("Avenir", size: 13))
                                .foregroundColor(.blue)
                                .bold()
                            
                            Spacer()
                        }.padding(.leading, 30)
                    } else {
                        HStack {
                            Text("You pay:")
                                .font(.custom("Avenir", size: 13))
                            Text("$\(totalPay_3, specifier: "%.2f")")
                                .font(.custom("Avenir", size: 13))
                                .foregroundColor(.blue)
                                .bold()
                            
                            Spacer()
                        }.padding(.leading, 30)
                    }
                }
                .padding(10)
                
                // MARK: Recvr Amount
                let zarRecvFigure = (liveZARrate * zarSendFigure)
                
                VStack {
                    HStack {
                        Text("Receiving:")
                            .font(.custom("Avenir", size: 13))
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                        
                        Image("south-africa")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text("\(Float(zarRecvFigure), specifier: "%.2f")ZAR")
                            .font(.custom("Avenir", size: 16))
                            .bold()
                        
                        Spacer()
                    }
                }
                .frame(width: 275, height: 75)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 1)
                        .frame(width: 350))
                
                // MARK: Arrival time
                HStack {
                    Text("Should arrive within:")
                        .font(.custom("Avenir", size: 13))
                        .foregroundColor(.black)
                    Text(arrivalDate)
                        .font(.custom("Avenir", size: 13))
                        .foregroundColor(.blue)
                        .bold()
                    
                    Spacer()
                }
                .padding(.leading, 30)
                
            }
        }
    }
}
