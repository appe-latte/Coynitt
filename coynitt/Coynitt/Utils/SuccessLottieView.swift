//
//  SuccessLottieView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-11-18.
//

import Lottie
import SwiftUI

struct SuccessLottieView: UIViewRepresentable {
    var name = "lf30_editor_0j77vfw9"
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<SuccessLottieView>) -> UIView  {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
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
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SuccessLottieView>) {
        
    }
}
