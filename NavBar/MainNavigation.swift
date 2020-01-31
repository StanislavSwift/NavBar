//
//  MainNavigation.swift
//  NavBar
//
//  Created by Stanislav on 31.01.2020.
//  Copyright © 2020 Stanislav. All rights reserved.
//

import UIKit

final class MainNavigation: UINavigationController {
    
    enum TextStrings {
        
        enum AutoMall: String {
            case filterReset = "Сбрость"
        }
    }
    
    enum ButtonsImages {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension MainNavigation {
    
    // MARK: Navigation Controller Setup
    
    // MARK: Back Button
    func backButton() -> UIBarButtonItem {
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        backButton.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.003921568627, green: 0, blue: 0.09019607843, alpha: 1),
            NSAttributedString.Key.font: R.font.sfProDisplayBold(size: 14)
        ], for: .normal)
        
        backButton.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.003921568627, green: 0, blue: 0.09019607843, alpha: 1),
            NSAttributedString.Key.font: R.font.sfProDisplayBold(size: 14)
        ], for: .selected)
    
        return backButton
    }
    
    // MARK: Large title with subtitle
    func largeTitle() -> UIView {
        
        let title       = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 44))
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        title.text      = "Тестовый длинный заголовок на две строки"
        title.font      = R.font.sfProDisplayBold(size: 30)
        
        let subTitle    = UILabel()
        subTitle.numberOfLines = 1
        subTitle.lineBreakMode = .byTruncatingTail
        subTitle.text   = "Подзаголовок подзаголовок подзаголовок"
        subTitle.font   = R.font.sfProDisplayMedium(size: 14)
        
        let largeTitleView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 44))
        
        largeTitleView.backgroundColor = .green
        
        largeTitleView.addSubview(title)
        largeTitleView.addSubview(subTitle)
        
        return largeTitleView
    }
    
    // MARK: Auto Mall Navigation Bar Control
    func automallControlsItem() -> UIBarButtonItem {
        
        let buttonSize      = CGSize(width: 28, height: 44)
        
        let favotiteButton  = self.getControlButton("navbar-icon-favorite", size: buttonSize, selector: #selector(showFavorites))
        favotiteButton.imageEdgeInsets.left = -8
        
        let sortButton      = self.getControlButton("navbar-icon-sort", size: buttonSize, x: buttonSize.width, selector: #selector(showSortFilter))
        sortButton.imageEdgeInsets.left = 8
        
        let controlsView    = UIView(frame: CGRect(x: 0, y: 0, width: buttonSize.width*2, height: buttonSize.height))
        controlsView.addSubview(favotiteButton)
        controlsView.addSubview(sortButton)
        
        controlsView.backgroundColor = .green
        
        return UIBarButtonItem(customView: controlsView)
    }
    
    func automallFilterResetItem() -> UIBarButtonItem {
        
        let resetButton = UIBarButtonItem(title: TextStrings.AutoMall.filterReset.rawValue, style: .plain, target: nil, action: nil)
        
        resetButton.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7333333333, green: 0.7568627451, blue: 0.7725490196, alpha: 1),
            NSAttributedString.Key.font: R.font.sfProDisplayMedium(size: 12)
        ], for: .normal)
        
        return resetButton
    }
    
    func getControlButton(_ imageName: String, size: CGSize, x inset: CGFloat = 0, selector: Selector) -> UIButton {
        let button = UIButton(frame: CGRect(x: inset, y: 0, width: size.width, height: size.height))
        // FIXME: Заменить подгрузку изображения через R.swif (заменить везде при вызове UIImage(named:))
        button.setImage(UIImage(named: imageName), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: selector, for: .touchUpInside)
        return button
    }
    
    @objc func showFavorites() {
        debugPrint("Favorites")
    }
    
    @objc func showSortFilter() {
        debugPrint("Sort Filter")
    }
}
