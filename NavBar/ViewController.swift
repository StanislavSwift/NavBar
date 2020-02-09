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
        
        debugPrint(38299)
    }
    
    @IBAction func nextController(_ sender: UIButton) {
        let secondController = SecondController()
        secondController.view.backgroundColor = .red
        self.navigationController?.pushViewController(secondController, animated: true)
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        if let customNav = self.navigationController as? MainNavigation {
            customNav.scroll(yOffset)
        }
    }
}
