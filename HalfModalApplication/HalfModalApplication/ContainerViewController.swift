//
//  ContainerViewController.swift
//  HalfModalApplication
//
//  Created by P1714 on 2023/05/17.
//

import UIKit

class ContainerViewController: UIViewController {
    // Child ViewControllers
    var mainViewController: UIViewController!
    var halfModalViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the main and modal view controllers
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        halfModalViewController = storyboard.instantiateViewController(withIdentifier: "HalfModalViewController")

        // Add the main view controller as a child
        addChild(mainViewController)
        view.addSubview(mainViewController.view)
        mainViewController.didMove(toParent: self)
    }
    
    // Then, you can add methods to show/hide the modal view controller as needed.
    func showModal() {
        
        // Add the modal view controller as a child
        addChild(halfModalViewController)
        view.addSubview(halfModalViewController.view)
        halfModalViewController.didMove(toParent: self)
        
        // Position the modal view off the bottom of the screen
        halfModalViewController.view.frame = CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: view.bounds.height)

        // Animate it into view
        UIView.animate(withDuration: 0.25) {
            self.halfModalViewController.view.frame = CGRect(x: 0,
                                                             y: self.view.bounds.height / 2,
                                                             width: self.view.bounds.width,
                                                             height: self.view.bounds.height / 2)
        }
    }
    
    func hideModal() {
        // Animate the modal view off the bottom of the screen
        UIView.animate(withDuration: 0.25, animations: {
            self.halfModalViewController.view.frame = CGRect(x: 0, y: self.view.bounds.height, width: self.view.bounds.width, height: self.view.bounds.height)
        }) { _ in
            // Once the animation is complete, remove the modal view controller
            self.halfModalViewController.view.removeFromSuperview()
            self.halfModalViewController.removeFromParent()
        }
    }
}
