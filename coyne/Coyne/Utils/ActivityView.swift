//
//  ActivityView.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

struct ActivityView: View {
    
    var body: some View {
        GeometryReader { geo in
            Rectangle()
                .fill(cynGreen)
                .frame(width: geo.size.width, height: geo.size.height)
                .cornerRadius(15, corners: [.topLeft, .topRight])
                .edgesIgnoringSafeArea(.all)
        }
    }
}
