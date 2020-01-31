//
//  SecondController.swift
//  NavBar
//
//  Created by Stanislav on 31.01.2020.
//  Copyright © 2020 Stanislav. All rights reserved.
//

import UIKit

final class SecondController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр Фильтр "
        
        let resetButton = UIBarButtonItem(title: "Сбросить", style: .plain, target: self, action: nil)
        
        resetButton.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7333333333, green: 0.7568627451, blue: 0.7725490196, alpha: 1),
            NSAttributedString.Key.font: R.font.sfProDisplayMedium(size: 12)
        ], for: .selected)
        
        resetButton.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7333333333, green: 0.7568627451, blue: 0.7725490196, alpha: 1),
            NSAttributedString.Key.font: R.font.sfProDisplayMedium(size: 12)
        ], for: .normal)
        
        self.navigationItem.rightBarButtonItem = resetButton
    }
}
