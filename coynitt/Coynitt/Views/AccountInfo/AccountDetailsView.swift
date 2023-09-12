//
//  AccountDetailsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import SwiftUI

struct AccountDetailsView: View {
    @State private var accountNumber : Int = 3738122
    @State private var institutionNum : Int = 707
    @State private var transitNum : Int = 87362
    @State private var swiftCode : String = "CYNT182"
    
    @State var rowHeight = 55.0 // sets row height for list
    
    var body: some View {
        NavigationView {
            ZStack {
                cynOlive
                    .ignoresSafeArea()
                
                VStack {
                    Form {
                        // MARK: Deposit Protection
                        Section {
                            VStack {
                                HStack(spacing: 10) {
                                    Image("cdic-logo")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 15, height: 15)
                                        .padding(.horizontal, 2)
                                    
                                    Text("All customer deposits are monitored and protected by the CDIC.")
                                        .font(.system(size: 12))
                                        .fontWeight(.medium)
                                        .textCase(.uppercase)
                                        .foregroundColor(.black)
                                        .padding(2)
                                }
                                
                                HStack {
                                    Button(action: {}, label: {
                                        Text("More info")
                                            .font(.system(size: 10))
                                            .fontWeight(.semibold)
                                            .textCase(.uppercase)
                                            .kerning(1)
                                            .foregroundColor(.blue)
                                        
                                    })
                                    
                                    Spacer()
                                }
                            }
                        }
                        
                        
                    }
                    .environment(\.defaultMinListRowHeight, rowHeight)
                    .foregroundColor(Color.black)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .accentColor(cynWhite)
    }
}
