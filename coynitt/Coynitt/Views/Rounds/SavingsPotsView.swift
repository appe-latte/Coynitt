//
//  SavingsPotsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 11/03/2022.
//

import SwiftUI

struct SavingsPotsView: View {
    @State var progressValue: Float = 0.0
    
    // MARK: Activity Sheet
    @State var showSavingsActionSheet = false
    @State var activeSheet: ActiveSheet?
    
    var body: some View {
        ZStack {
            bgWhite()
            VStack {
                // MARK: Group 1
                Group {
                    HStack {
                        // Pot 1
                        HStack {
                            VStack {
                                Image("car-pot")
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 50)
                                Text("Vehicle Pot")
                                    .font(.custom("Avenir", size: 12))
                                    .foregroundColor(.black)
                                    .scaledToFill()
                                    .minimumScaleFactor(0.5)
                                
                                ProgressBar(value: $progressValue).frame(width: 100, height: 15)
                            }
                            .padding(5)
                        }
                        .frame(width: 120, height: 120)
                        .background(Color.gray.opacity(0.20))
                        .cornerRadius(15)
                        
                        
                        // Pot 2
                        HStack {
                            VStack {
                                Image("holiday-pot")
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 50)
                                Text("Holiday Pot")
                                    .font(.custom("Avenir", size: 12))
                                    .foregroundColor(.black)
                                    .scaledToFill()
                                    .minimumScaleFactor(0.5)
                                
                                ProgressBar(value: $progressValue).frame(width: 100, height: 15)
                            }
                            .padding(5)
                        }
                        .frame(width: 120, height: 120)
                        .background(Color.gray.opacity(0.20))
                        .cornerRadius(15)
                        
                        Spacer()
                    }
                }.padding(10)
                
                Spacer()
            }
        }
        .toolbar {
            Button(action: {
                self.showSavingsActionSheet.toggle()
            }, label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(10)
                    .foregroundColor(cynWhite)
                    .clipShape(Circle())
            })
                .actionSheet(isPresented: $showSavingsActionSheet) {
                    ActionSheet(title: Text("Rounds Group"), message: Text("Which savings pot would you like to start with?"), buttons: [
                        .default(Text("Savings Pot")){
                            activeSheet = .savings
                        },
                        .default(Text("Vehicle Pot")){
                            activeSheet = .vehicle
                        },
                        .default(Text("Holiday Pot")){
                            activeSheet = .holiday
                        },
                        .default(Text("College Fund")){
                            activeSheet = .coll_fund
                        },
                        .default(Text("Home Repair")){
                            activeSheet = .hm_repair
                        },
                        .default(Text("Vehicle Repair")){
                            activeSheet = .veh_repair
                        },
                        .cancel()
                    ])
                }
        }
    }
}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(cynGreen)
                
                Rectangle().frame(width: 60.0, height: geometry.size.height)
                    .foregroundColor(cynGreen)
            }.cornerRadius(45.0)
        }
    }
}

enum ActiveSheet: Identifiable {
    case vehicle, holiday, savings, hm_repair, veh_repair, coll_fund
    
    var id: Int {
        hashValue
    }
}
