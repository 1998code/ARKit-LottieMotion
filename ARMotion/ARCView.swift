//
//  ARCView.swift
//  ARMotion
//
//  Created on 9/2/20.
//

import SwiftUI
import Lottie

struct ARCView: View {
    @State var play = 1
    var body: some View {
        VStack {
            Text("Thank you @Healthcare Workers!")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundColor(.black)
            LottieView(name: "17896-wash-your-hands", play: $play)
        }
    }
}

struct ARCView_Previews: PreviewProvider {
    static var previews: some View {
        ARCView()
    }
}

struct LottieView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    var name: String!
    @Binding var play:Int

    var animationView = AnimationView()

    class Coordinator: NSObject {
        var parent: LottieView

        init(_ animationView: LottieView) {
            self.parent = animationView
            super.init()
        }
    }

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()

        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        animationView.loopMode = .loop
        animationView.play()
    }
}
