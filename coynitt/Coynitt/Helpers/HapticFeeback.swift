//
//  HapticFeeback.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-11.
//

import SwiftUI

extension View {
    func HapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) -> some View {
        self.onTapGesture {
            let impact = UIImpactFeedbackGenerator(style: style)
            impact.impactOccurred()
        }
    }
}
