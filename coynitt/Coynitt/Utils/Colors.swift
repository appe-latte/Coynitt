//
//  Colors.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

let cynWhite = Color(red: 242 / 255, green: 241 / 255, blue: 237 / 255)
let cynGreen = Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255)
let cynGreen2 = Color(red: 96 / 255, green: 184 / 255, blue: 181 / 255)
let cynRed = Color(red: 238 / 255, green: 152 / 255, blue: 154 / 255)
let cynBlue = Color(red: 187 / 255, green: 209 / 255, blue: 245 / 255)
let cynOrange = Color(red: 255 / 255, green: 209 / 255, blue: 155 / 255)

struct bgWhite: View {
    var body: some View {
        Rectangle()
            .fill(Color(red: 242 / 255, green: 241 / 255, blue: 237 / 255))
            .edgesIgnoringSafeArea(.all)
    }
}
