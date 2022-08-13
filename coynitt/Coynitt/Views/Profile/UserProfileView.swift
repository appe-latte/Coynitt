//
//  UserProfileView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 13/04/2022.
//

import SwiftUI

struct customHeader : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let posX = rect.origin.x
        let posY = rect.origin.y
        
        path.move(to: CGPoint(x: posX, y: posY))
        path.addLine(to: CGPoint(x: posX + width, y: posY))
        path.addLine(to: CGPoint(x: posX, y: posY + height))
//        path.addQuadCurve(to: <#T##CGPoint#>, control: <#T##CGPoint#>)
        
        return path
    }
}

struct UserProfileView: View {
    var body: some View {
        ZStack {
            Text("Displays User Profile")
        }
        .navigationTitle("User Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}
