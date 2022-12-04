//
//  BillPayView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-11-18.
//

import SwiftUI

struct BillPayView: View {
    @State var rowHeight = 50.0
    
    @State var dstv_bill = false
    @State var malaicha_shop = false
    
    var body: some View {
        ZStack {
            cynWhite
            
            // MARK: Pick Service Provider
            NavigationView {
                ZStack {
                    cynWhite
                    Form {
                        
                        Section(header: Text("Multichoice Africa")) {
                            // MARK: Multichoice-ZA
                            NavigationLink(destination: PaymentsView()){
                                Image("multichoice")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                                VStack {
                                    HStack {
                                        Text("Multichoice (ZA)")
                                            .font(.custom("Avenir", size: 13).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Pay for your DSTV subscription in South Africa")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            // MARK: Multichoice-ZW
                            NavigationLink(destination: PaymentsView()){
                                Image("multichoice")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                                VStack {
                                    HStack {
                                        Text("Multichoice (ZW)")
                                            .font(.custom("Avenir", size: 13).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Pay for your DSTV subscription in Zimbabwe")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                        // MARK: Airtime / Top-Up
                        Section(header: Text("Airtime/ Top-up")){
                            
                            // MARK: MTN (ZA)
                            NavigationLink(destination: PaymentsView()){
                                Image("mtn")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                                VStack {
                                    HStack {
                                        Text("MTN (ZA)")
                                            .font(.custom("Avenir", size: 13).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Pay for airtime / top-up mobile number")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            // MARK: Econet (ZW)
                            NavigationLink(destination: PaymentsView()){
                                Image("econet")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                                VStack {
                                    HStack {
                                        Text("Econet (ZW)")
                                            .font(.custom("Avenir", size: 13).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Pay for airtime / top-up mobile number")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            // MARK: Vodacom (ZA)
                            
                            NavigationLink(destination: PaymentsView()){
                                Image("vodacom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                                VStack {
                                    HStack {
                                        Text("Vodacom (ZA)")
                                            .font(.custom("Avenir", size: 13).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Pay for airtime / top-up mobile number")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                        // MARK: Utility Bill payments
                        Section(header: Text("Utilities")){
                            
                            // MARK: Eskom-ZA
                            NavigationLink(destination: PaymentsView()){
                                Image("eskom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                                VStack {
                                    HStack {
                                        Text("Eskom")
                                            .font(.custom("Avenir", size: 13).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Pay Eskom utility bill")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
