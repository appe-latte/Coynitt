//
//  MainRoundsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 11/03/2022.
//

import SwiftUI

struct MainRoundsView: View {
    @State var showRoundsInfoSheet = false
    @State var progressValue: Float = 0.0
    
    // MARK: Activity Sheet
    @State var showSavingsActionSheet = false
    @State var activeSheet: ActiveSheet?
    
    var body: some View {
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        ZStack {
            cynWhite
            VStack {
                Rectangle()
                    .fill(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
                    .cornerRadius(15, corners: [.bottomRight])
                    .frame(width: UIScreen.main.bounds.width, height: 110)
                    .edgesIgnoringSafeArea(.all)
                
                // MARK: Group 1
                Group {
                    HStack {
                        // MARK: Pot One
                        VStack(alignment: .center, spacing: 10) {
                            HStack {
                                Text("Rounds: Furniture")
                                    .font(.custom("Avenir", size: 15).bold())
                                    .foregroundColor(.black)
                                    .minimumScaleFactor(0.5)
                                
                                //                                Spacer()
                            }
                            
                            Image("sofa")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 70)
                            
                            // MARK: Progress Bar
                            HStack(spacing: 5) {
                                Text("Progress:")
                                    .font(.custom("Avenir", size: 10).bold())
                                
                                ProgressBar(value: $progressValue).frame(width: 100, height: 15)
                                
                                Spacer()
                            }
                            .padding(10)
                            
                            Button(action: {showRoundsInfoSheet.toggle()}, label: {
                                Text("View")
                                    .font(.custom("Avenir", size: 12).bold())
                                    .foregroundColor(.white)
                                    .minimumScaleFactor(0.5)
                            })
                            .frame(width: 100, height: 30)
                            .background(cynGreen2)
                            .clipShape(Capsule())
                            .sheet(isPresented: $showRoundsInfoSheet) {
                                ZStack {
                                    cynWhite
                                    
                                    RoundsView()
                                }
                                .ignoresSafeArea()
                                .presentationDetents([.large, .fraction(0.95)])
                            }
                            
                        }
                        .frame(width: screenWidth / 2, height: screenHeight / 4)
                        .background(cynGreen.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(cynGreen2, style: StrokeStyle(lineWidth: 0.5))
                        )
                        
                        
                        Spacer()
                    }
                }.padding(10)
                
                Spacer()
            }
            
            .padding(.top, -100)
            
        }
        .navigationTitle("Rounds")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button(action: {
                    
                }, label: {
                    VStack {
                        Image("add")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(cynWhite)
                            .clipShape(Circle())
                        
                        Text("Add")
                            .font(.system(size: 10))
                            .foregroundColor(cynWhite)
                    }
                })
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
                    .foregroundColor(cynPurple)
                
                Rectangle().frame(width: 60.0, height: geometry.size.height)
                    .foregroundColor(cynPurple)
            }
            .cornerRadius(45.0)
        }
    }
}

enum ActiveSheet: Identifiable {
    case vehicle, holiday, savings, hm_repair, veh_repair, coll_fund
    
    var id: Int {
        hashValue
    }
}

enum Rounds {
    case Furniture
    case Fees
    case Repairs
    case Groceries
    case Car
    case Travel
}
