//
//  HalfModalViewController.swift
//  HalfModalApplication
//
//  Created by P1714 on 2023/05/17.
//

import UIKit

class HalfModalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleDrag(_:)))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc private func handleDrag(_ recognizer: UIPanGestureRecognizer) {
        guard let presentedView = self.view else { return }

        switch recognizer.state {
        case .began:
            // Start of the gesture
            recognizer.setTranslation(presentedView.frame.origin, in: presentedView)
        case .changed:
            // During the gesture
            let translation = recognizer.translation(in: presentedView)
            let posY =  max(translation.y, 0) // Prevent going off the top
            presentedView.frame = CGRect(x: self.view.frame.origin.x,
                                         y: posY,
                                         width: self.view.frame.size.width,
                                         height: self.view.frame.size.height + posY)
        case .ended:
            break
            // End of the gesture
            // Here you can add code to "snap" the modal to a certain height, if desired
        default:
            break
        }
    }
}


