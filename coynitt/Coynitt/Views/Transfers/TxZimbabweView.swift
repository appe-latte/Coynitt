//
//  ZwExchangeView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 13/08/2022.
//

import SwiftUI
import CountryPicker

struct TxZimbabweView : View {
    @State private var zwSendFigure : Float = 0.00
    @State private var arrivalDate = "10 minutes"
    @State var isChecked : Bool = false
    
    @State var senderFirstName : String = ""
    @State var senderLastName : String = ""
    @State var senderCellNum : String = ""
    
    // MARK: Country Picker
    @State private var country: Country?
    @State private var showCountryPicker = false
    
    @State var rowHeight = 40.0
    
    func toggle(){ isChecked = !isChecked }
    
    var body: some View {
        
        ZStack {
            cynWhite
            VStack {
                // MARK: Conversion rates
                let rate_1 = zwSendFigure * 0.025
                let rate_2 = zwSendFigure * 0.005
                let rate_3 = zwSendFigure * 0.01
                
                // MARK: Tx + rate
                let totalPay_1 = zwSendFigure + rate_1
                let totalPay_2 = zwSendFigure + rate_2
                let totalPay_3 = zwSendFigure + rate_3
                
                // MARK: Recvr Amount
                let zwRecvFigure = zwSendFigure
                
                Form {
                    // MARK: Sender Information
                    
                    Section(header: Text("Sender Information")) {
                        // MARK: Sender "First Name"
                        
                        HStack {
                            Text("First Name:")
                                .font(.custom("Avenir", size: 13))
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                            
                            TxCustomTextField(text: $senderFirstName, placeholder: Text(""))
                                .font(.custom("Avenir", size: 16))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(5)
                        }
                        
                        // MARK: Sender "Last Name"
                        
                        HStack {
                            Text("Last Name:")
                                .font(.custom("Avenir", size: 13))
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                            
                            TxCustomTextField(text: $senderLastName, placeholder: Text(""))
                                .font(.custom("Avenir", size: 16))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(5)
                        }
                        
                        // MARK: Sender "Mobile"
                        HStack {
                            Text("Mobile No.:")
                                .font(.custom("Avenir", size: 13))
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                            
                            HStack(spacing: 16){
                                Button {
                                    self.showCountryPicker = true
                                } label: {
                                    Text(country != nil ? "\(country!.isoCode.getFlag())+\(country!.phoneCode)" : "\("ZW".getFlag())+263").font(.custom("Avenir", size: 16))
                                }.sheet(isPresented: $showCountryPicker) {
                                    CountryPickerView(country: $country)
                                }
                                .frame(width: 65, height: 30)
                                .foregroundColor(.black)
                                .padding(.leading, 5)
                                
                                TextField("e.g., 772 765945", text: $senderCellNum)
                                    .font(.custom("Avenir", size: 16))
                                    .keyboardType(.numberPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(cynWhite)
                    
                    // MARK: "Transaction"
                    
                    Section(header: Text("Sending")) {
                        // MARK: "Sending" amount
                        HStack {
                            Text("Amount:")
                                .font(.custom("Avenir", size: 13))
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                            
                            Image("united-states")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            TextField("0.00", value: $zwSendFigure, format: .number)
                                .font(.custom("Avenir", size: 16))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                                .foregroundColor(.black)
                        }
                        
                        // MARK: Conversion + Fee rates
                        HStack {
                            HStack {
                                Text("Our Fee:")
                                    .font(.custom("Avenir", size: 11))
                                if (zwSendFigure <= 100) {
                                    Text("\(Float(rate_1), specifier: "%.2f")")
                                        .font(.custom("Avenir", size: 13))
                                        .foregroundColor(.blue)
                                        .bold()
                                } else if (zwSendFigure > 100 && zwSendFigure < 500) {
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
                            }.padding(.leading, 5)
                            
                            if (zwSendFigure <= 100) {
                                HStack {
                                    Text("You pay:")
                                        .font(.custom("Avenir", size: 11))
                                    Text("$\(totalPay_1, specifier: "%.2f")")
                                        .font(.custom("Avenir", size: 13))
                                        .foregroundColor(.blue)
                                        .bold()
                                    
                                    Spacer()
                                }.padding(.leading, 5)
                            } else if (zwSendFigure > 100 && zwSendFigure < 500) {
                                HStack {
                                    Text("You pay:")
                                        .font(.custom("Avenir", size: 11))
                                    Text("$\(totalPay_2, specifier: "%.2f")")
                                        .font(.custom("Avenir", size: 13))
                                        .foregroundColor(.blue)
                                        .bold()
                                    
                                    Spacer()
                                }.padding(.leading, 5)
                            } else {
                                HStack {
                                    Text("You pay:")
                                        .font(.custom("Avenir", size: 11))
                                    Text("$\(totalPay_3, specifier: "%.2f")")
                                        .font(.custom("Avenir", size: 13))
                                        .foregroundColor(.blue)
                                        .bold()
                                    
                                    Spacer()
                                }.padding(.leading, 5)
                            }
                        }
                        
                        // MARK: "Received" amount
                        HStack {
                            Text("Receiving:")
                                .font(.custom("Avenir", size: 13))
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                            
                            Image("united-states")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            Text("$\(Float(zwRecvFigure), specifier: "%.2f")")
                                .font(.custom("Avenir", size: 20))
                                .bold()
                            
                            Spacer()
                            
                            HStack {
                                Text("Should arrive:")
                                    .font(.custom("Avenir", size: 10))
                                    .foregroundColor(.black)
                                Text(arrivalDate)
                                    .font(.custom("Avenir", size: 10))
                                    .foregroundColor(.blue)
                                    .bold()
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(cynWhite)
                    
                    // MARK: Collection Method
                    
                    Section(header: Text("Collection Method")) {
                        // MARK: Sender "First Name"
                        
                        HStack {
                            Text("Cash Pick-Up:")
                                .font(.custom("Avenir", size: 13))
                                .frame(width: 50)
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                            
                            Button(action: toggle){
                                Image(systemName: isChecked ? "circle.circle.fill": "circle")
                                    .foregroundColor(.black)
                            }
                            Image(systemName: "building.columns.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        
                        // MARK: Collection: "Bank"
                        
                        HStack {
                            Text("Bank Account:")
                                .font(.custom("Avenir", size: 13))
                                .frame(width: 50)
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                            
                            Button(action: toggle){
                                Image(systemName: isChecked ? "circle.circle.fill": "circle")
                                    .foregroundColor(.black)
                            }
                            Image(systemName: "building.columns.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        
                        // MARK: Collection: "Ecocash"
                        HStack {
                            Text("Wallet:")
                                .font(.custom("Avenir", size: 13))
                                .frame(width: 50)
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                            
                            Button(action: toggle){
                                Image(systemName: isChecked ? "circle.circle.fill": "circle")
                                    .foregroundColor(.black)
                            }
                            Image("ecocash")
                                .resizable()
                                .frame(width: 60, height: 25)
                        }
                        
                        HStack{
                            //
                            // empty -- for space
                            //
                        }
                        
                        // MARK: "Upgrade" button
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                //
                            }, label: {
                                Text("Continue")
                                    .fontWeight(.semibold)
                                    .frame(width: 150, height: 50)
                                    .background(cynGreen)
                                    .clipShape(Capsule())
                                    .foregroundColor(.white)
                                    .textCase(.uppercase)
                            })
                            
                            Spacer()
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(cynWhite)
                }
                .environment(\.defaultMinListRowHeight, rowHeight)
                .background(Color.blue)
            }
        }
    }
}
