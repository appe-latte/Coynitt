//
//  Colors.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

let cynWhite = Color(red: 242 / 255, green: 241 / 255, blue: 237 / 255)
let cynGreen = Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255)
let cynGreen2 = Color(red: 96 / 255, green: 184 / 255, blue: 181 / 255)

struct bgWhite: View {
    var body: some View {
        Rectangle()
            .fill(Color(red: 242 / 255, green: 241 / 255, blue: 237 / 255))
            .edgesIgnoringSafeArea(.all)
    }
}
