//
//  TopSheetShape.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 13/04/2022.
//

import Foundation
import SwiftUI

struct TopSheetShape: View {
    var body: some View {
        GeometryReader { geo in
            Rectangle()
                .fill(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
                .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                .frame(width: geo.size.width, height: 180)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
