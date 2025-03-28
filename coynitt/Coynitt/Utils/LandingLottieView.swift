//
//  LandingLottieView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-21.
//

import SwiftUI
import Lottie

struct LandingLottieView: UIViewRepresentable {
    var name = "lf30_editor_0j77vfw9"
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<LandingLottieView>) -> UIView  {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView()
               let animation = Animation.named(name)
               animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
               animationView.loopMode = loopMode
               animationView.play()

               animationView.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview(animationView)
               NSLayoutConstraint.activate([
                   animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
                   animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
               ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LandingLottieView>) {
        
    }
}
