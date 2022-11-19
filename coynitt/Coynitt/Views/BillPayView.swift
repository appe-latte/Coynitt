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
            // MARK: Account Balance
            VStack {
                // MARK: Country Picker
                VStack {
                    HStack {
                        Text("Pick service provider:")
                            .font(.custom("Avenir", size: 12))
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    // ROW ONE:
                    HStack {
                        
                        // MARK: Multichoice
                        Button(action: {
                            //
                        }, label: {
                            VStack {
                                Image("multichoice")
                                    .resizable()
                                    .frame(width: 80, height: 50)
                                    .padding(10)
                                Text("Multichoice")
                                    .font(.custom("Avenir", size: 10))
                                    .foregroundColor(.black)
                            }
                        })
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 0.5))
                        
                        // MARK: Checkers
                        Button(action: {
                            //
                        }, label: {
                            VStack {
                                Image("checkers")
                                    .resizable()
                                    .frame(width: 80, height: 60)
                                    .cornerRadius(5)
                                    .padding(5)
                                Text("Checkers")
                                    .font(.custom("Avenir", size: 10))
                                    .foregroundColor(.black)
                            }
                        })
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 0.5))
                        
                        // MARK: MTN
                        Button(action: {
                            //
                        }, label: {
                            VStack {
                                Image("mtn")
                                    .resizable()
                                    .frame(width: 80, height: 60)
                                    .cornerRadius(5)
                                    .padding(5)
                                Text("MTN-ZA")
                                    .font(.custom("Avenir", size: 10))
                                    .foregroundColor(.black)
                            }
                        })
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 0.5))
                        
                        // MARK: Econet
                        Button(action: {
                            //
                        }, label: {
                            VStack {
                                Image("econet")
                                    .resizable()
                                    .frame(width: 80, height: 60)
                                    .cornerRadius(5)
                                    .padding(5)
                                Text("Econet-ZW")
                                    .font(.custom("Avenir", size: 10))
                                    .foregroundColor(.black)
                            }
                        })
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 0.5))
                        
                    }
                }
                .padding(.top, 30)
                
                Spacer()
            }
        }
    }
}
