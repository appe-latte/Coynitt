//
//  TransactionView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-10-11.
//

import SwiftUI
import Charts

struct TransactionView: View {
    @State var rowHeight = 50.0 // sets row height for list
    
    let dummyActivity = [
        Activity(activDate: "31-Sep", activName: "To: Marshawn Lychee", activAmount: 135.25),
        Activity(activDate: "31-Sep", activName: "To: Russell Wheelson", activAmount: 450.00),
        Activity(activDate: "27-Sep", activName: "Pay: Multichoose (ZAR) *AG18773", activAmount: 65.15),
        Activity(activDate: "25-Sep", activName: "Add: Funds", activAmount: 245.00),
        Activity(activDate: "25-Sep", activName: "From: Stanford Khumalo", activAmount: 120.00),
        Activity(activDate: "25-Sep", activName: "To: Dakson Prescott", activAmount: 750.29),
        Activity(activDate: "17-Sep", activName: "To: Paul Mahoomes", activAmount: 135.25),
        Activity(activDate: "17-Sep", activName: "From: Libra James", activAmount: 450.00),
        Activity(activDate: "15-Sep", activName: "Pay: Eiskom *AG18773", activAmount: 65.15),
        Activity(activDate: "14-Sep", activName: "Pay: Mobile top-up (eco) * - 9837", activAmount: 15.00),
        Activity(activDate: "12-Sep", activName: "To: Alberto Nyathi", activAmount: 120.00),
        Activity(activDate: "11-Sep", activName: "To: Stewie Gerrard", activAmount: 750.29),
        Activity(activDate: "11-Sep", activName: "From: Paulo Figo", activAmount: 135.25),
        Activity(activDate: "07-Sep", activName: "To: Zinedo Zidane", activAmount: 450.00)
    ]
    
    let chartData: [DataItem] = [
        DataItem(name: "Jan", value: 486),
        DataItem(name: "Feb", value: 87),
        DataItem(name: "Mar", value: 725),
        DataItem(name: "Apr", value: 439),
        DataItem(name: "May", value: 287),
        DataItem(name: "Jun", value: 771),
        DataItem(name: "Jul", value: 873),
        DataItem(name: "Aug", value: 569),
        DataItem(name: "Sep", value: 287),
        DataItem(name: "Oct", value: 134),
        DataItem(name: "Nov", value: 657),
        DataItem(name: "Dec", value: 403)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                cynWhite
                VStack {
                    Rectangle()
                        .fill(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
                        .cornerRadius(15, corners: [.bottomRight])
                        .frame(width: UIScreen.main.bounds.width, height: 120)
                        .edgesIgnoringSafeArea(.all)
                    
                    // MARK: Line Chart
                    VStack {
                        HStack {
                            Text("Monthly Summary")
                                .font(.custom("Avenir", size: 14).bold())
                            
                            Spacer()
                        }
                        .padding(.leading, 10)
                        
                        Chart {
                            ForEach(chartData) { item in
                                LineMark(
                                    x: .value("Month", item.name),
                                    y: .value("Amount", item.value)
                                )
                                .lineStyle(.init(lineWidth: 3, lineCap: .round, lineJoin: .round))
                            }
                            .foregroundStyle(cynGreen2)
                            .interpolationMethod(.linear)
                            .symbol(Circle())
                        }
                        .chartPlotStyle { plotArea in
                            plotArea
                                .background(cynGreen.opacity(0.05))
                        }
                    }
                    .font(.custom("Avenir", size: 10).bold())
                    .frame(width: UIScreen.main.bounds.width, height: 250, alignment: .center)
                    .padding(20)
                    
                    
                    Spacer()
                    
                    // MARK: "Recent Transactions"
                    
                    Form {
                        Section(header: Text("Recent Transactions")) {
                            List(dummyActivity) { activity in
                                ActivityRow(activity: activity)
                            }
                        }
                    }
                    .foregroundColor(.black)
                    .environment(\.defaultMinListRowHeight, rowHeight)
                    
                }
                .padding(.top, -100) // <--- removes white space above form from Navigation view
                
                Spacer()
            }
            .accentColor(cynGreen)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Transaction History")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(cynWhite)
                        .textCase(.uppercase)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image("policy")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(cynWhite)
                                .clipShape(Circle())
                            
                            Text("Statements")
                                .font(.system(size: 10))
                                .foregroundColor(cynWhite)
                        }
                    })
                }
            }
        }
    }
    
    struct DataItem: Identifiable {
        let name: String
        let value: Double
        let id = UUID()
    }
    
    struct ChartHeaderView: View {
        var title: String
        var height: CGFloat
        
        var body: some View {
            Text(title)
                .frame(height: height)
        }
    }
}
