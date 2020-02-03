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
        

        
        self.title = "Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр "
        
        if let navBar = self.navigationController as? MainNavigation {
            
//            navBar.navigationItem.largeTitleDisplayMode = .always
            let testView = UIView()
            testView.backgroundColor = .yellow
            testView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
            
            self.navigationItem.titleView = testView
            self.navigationItem.accessibilityFrame = CGRect(x: 0, y: 200, width: 0, height: 0)
//            self.navigationItem.titleView?.frame.size.height = 100
            
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
