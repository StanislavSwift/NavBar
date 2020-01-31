//
//  ViewController.swift
//  NavBar
//
//  Created by Stanislav on 31.01.2020.
//  Copyright © 2020 Stanislav. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navBar = self.navigationController as? MainNavigation {
            self.navigationItem.titleView                 = navBar.largeTitle()
            self.navigationItem.titleView?.clipsToBounds  = true
            self.navigationItem.rightBarButtonItem        = navBar.automallControlsItem()
            self.navigationItem.backBarButtonItem         = navBar.backButton()
        }
    }
    
    @IBAction func nextController(_ sender: UIButton) {
        let secondController = SecondController()
        secondController.view.backgroundColor = .red
        self.navigationController?.pushViewController(secondController, animated: true)
    }
}
