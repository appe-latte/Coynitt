//
//  LatestActivity.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import Foundation
import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    let date: String
    let title: String
    let amount: Double
}

struct ActivityRow: View {
    var activity: Activity
    
    var body: some View {
        VStack {
            HStack {
                Text(activity.title)
                    .font(.custom("Avenir", size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text("\(activity.amount, specifier: "%.2f")")
                    .font(.custom("Avenir", size: 13))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            
            HStack {
                Text(activity.date)
                    .font(.custom("Avenir", size: 12))
                    .bold()
                    .foregroundColor(.gray)
                
                Spacer()
            }
        }
        .listRowBackground(cynWhite) // list background colour
        .edgesIgnoringSafeArea(.all)
    }
}
