//
//  TransactionView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-10-11.
//

import SwiftUI

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
        DataItem(name: "May", value: 619),
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
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                        .frame(width: UIScreen.main.bounds.width, height: 110)
                        .edgesIgnoringSafeArea(.all)
                    
                    // MARK: Bar Chart
                    BarChartView(title: "Monthly Summary", data: chartData)
                        .font(.custom("Avenir", size: 15).bold())
                        .frame(width: UIScreen.main.bounds.width, height: 250, alignment: .center)
                        .padding(.bottom, 20)
                        .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    // MARK: Recent transaction list
                    Form {
                        Section(header: Text("Transactions")) {
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
    
    struct BarChartView: View {
        var title: String
        var data: [DataItem]
        
        var body: some View {
            GeometryReader { gr in
                let headHeight = gr.size.height * 0.10
                VStack {
                    ChartHeaderView(title: title, height: headHeight)
                    ChartAreaView(data: data)
                }
            }
        }
    }
    
    struct ChartHeaderView: View {
        var title: String
        var height: CGFloat
        
        var body: some View {
            Text(title)
                .frame(height: height)
        }
    }
    
    struct ChartAreaView: View {
        var data: [DataItem]
        
        var body: some View {
            GeometryReader { gr in
                let fullBarHeight = gr.size.height * 0.90
                let maxValue = data.map { $0.value }.max()!
                
                ZStack {
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(#colorLiteral(red: 248 / 255, green: 248 / 255, blue: 248 / 255, alpha: 1)))
                    
                    VStack {
                        HStack(spacing:0) {
                            ForEach(data) { item in
                                BarView(
                                    name: item.name,
                                    value: item.value,
                                    maxValue: maxValue,
                                    fullBarHeight: Double(fullBarHeight))
                            }
                            .font(.custom("Avenir", size: 10).bold())
                        }
                        .padding(4)
                    }
                }
            }
        }
    }
    
    struct BarView: View {
        var name: String
        var value: Double
        var maxValue: Double
        var fullBarHeight: Double
        
        var body: some View {
            let barHeight = (Double(fullBarHeight) / maxValue) * value
            VStack {
                Spacer()
                ZStack {
                    VStack {
                        Spacer()
                        
                        if value < 200 {
                            RoundedRectangle(cornerRadius:5.0)
                                .fill(cynRed)
                                .frame(height: CGFloat(barHeight), alignment: .trailing)
                        } else if value > 200 && value < 500 {
                            RoundedRectangle(cornerRadius:5.0)
                                .fill(cynPurple)
                                .frame(height: CGFloat(barHeight), alignment: .trailing)
                        } else {
                            RoundedRectangle(cornerRadius:5.0)
                                .fill(cynGreen2)
                                .frame(height: CGFloat(barHeight), alignment: .trailing)
                        }
                    }
                    
                    VStack {
                        Spacer()
                        Text("\(value, specifier: "%.0F")")
                            .font(.custom("Avenir", size: 8).bold())
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                Text(name)
            }
            .padding(.horizontal, 4)
        }
    }
}
