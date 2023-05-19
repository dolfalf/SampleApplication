//
//  MainViewController.swift
//  HalfModalApplication
//
//  Created by P1714 on 2023/05/17.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Then, you can add methods to show/hide the modal view controller as needed.
    @IBAction func showModal(sender: UIButton) {
        
        if let owner = parent as? ContainerViewController {
            owner.showModal()
        }
    }
    
    @IBAction func hideModal(sender: UIButton) {
        if let owner = parent as? ContainerViewController {
            owner.hideModal()
        }
    }
    
    @IBAction func sample(sender: UIButton) {
        print("sample touched!!")
    }

}
