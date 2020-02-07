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

        self.title = "Фильтр"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func nextController(_ sender: UIButton) {
        let secondController = SecondController()
        secondController.view.backgroundColor = .red
        self.navigationController?.pushViewController(secondController, animated: true)
    }
}
