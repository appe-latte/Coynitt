//
//  Extension+View.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-30.
//  Extension code courtesy of Kavsoft
//

import SwiftUI

extension View {
    // MARK: Custom View Modifier
    func blurredSheet<Content: View>(_ style: AnyShapeStyle, show: Binding<Bool>, onDismiss: @escaping ()->(), @ViewBuilder content: @escaping ()->Content)-> some View {
        self
            .sheet(isPresented: show, onDismiss: onDismiss) {
                content()
                    .background(RemoveBackgroundColour())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background {
                        Rectangle()
                            .fill(style)
                            .ignoresSafeArea(.container, edges: .all)
                    }
            }
    }
}

// MARK: Helper View
fileprivate struct RemoveBackgroundColour: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            uiView.superview?.superview?.backgroundColor = .clear
        }
    }
}
