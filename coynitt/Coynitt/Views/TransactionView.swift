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
        Activity(activDate: "07-Mar", activName: "James Jones", activAmount: 135.25),
        Activity(activDate: "07-Mar", activName: "Russell Wilson", activAmount: 450.00),
        Activity(activDate: "05-Mar", activName: "Multichoice Africa *AG18773", activAmount: 65.15),
        Activity(activDate: "04-Mar", activName: "Mobile top-up (eco) * - 9837", activAmount: 45.00),
        Activity(activDate: "02-Mar", activName: "Stanford Khumalo", activAmount: 120.00),
        Activity(activDate: "28-Feb", activName: "James Jones", activAmount: 750.29),
        Activity(activDate: "07-Mar", activName: "James Jones", activAmount: 135.25),
        Activity(activDate: "07-Mar", activName: "Russell Wilson", activAmount: 450.00),
        Activity(activDate: "05-Mar", activName: "Multichoice Africa *AG18773", activAmount: 65.15),
        Activity(activDate: "04-Mar", activName: "Mobile top-up (eco) * - 9837", activAmount: 45.00),
        Activity(activDate: "02-Mar", activName: "Stanford Khumalo", activAmount: 120.00),
        Activity(activDate: "28-Feb", activName: "James Jones", activAmount: 750.29),
        Activity(activDate: "07-Mar", activName: "James Jones", activAmount: 135.25),
        Activity(activDate: "07-Mar", activName: "Russell Wilson", activAmount: 450.00),
        Activity(activDate: "05-Mar", activName: "Multichoice Africa *AG18773", activAmount: 65.15),
        Activity(activDate: "04-Mar", activName: "Mobile top-up (eco) * - 9837", activAmount: 45.00),
        Activity(activDate: "02-Mar", activName: "Stanford Khumalo", activAmount: 120.00),
        Activity(activDate: "28-Feb", activName: "James Jones", activAmount: 750.29),
        Activity(activDate: "07-Mar", activName: "James Jones", activAmount: 135.25),
        Activity(activDate: "07-Mar", activName: "Russell Wilson", activAmount: 450.00),
        Activity(activDate: "05-Mar", activName: "Multichoice Africa *AG18773", activAmount: 65.15),
        Activity(activDate: "04-Mar", activName: "Mobile top-up (eco) * - 9837", activAmount: 45.00),
        Activity(activDate: "02-Mar", activName: "Stanford Khumalo", activAmount: 120.00),
        Activity(activDate: "28-Feb", activName: "James Jones", activAmount: 750.29),
        Activity(activDate: "26-Feb", activName: "Adija Portmore", activAmount: 250.65)
    ]
    
    var body: some View {
        ZStack {
            cynWhite
            VStack {
                HStack {
                                       Text("Recent Transactions")
                                           .font(.system(size: 12))
                                           .bold()
                                           .foregroundColor(.gray)
                                           .textCase(.uppercase)
               
                                       Spacer()
               
                                       HStack{
                                           Text("See All")
                                               .bold()
                                           Image(systemName: "chevron.right")
                                       }
                                       .font(.system(size: 10))
                                       .foregroundColor(.gray)
                                       .padding(10)
                                   }.padding(.leading, 30)
                    
                Form {
                    Section {
                        List(dummyActivity) { activity in
                            ActivityRow(activity: activity)
                        }
                    }
                }
                .foregroundColor(.black)
                .environment(\.defaultMinListRowHeight, rowHeight)
            }
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
