//
//  MainNavigation.swift
//  NavBar
//
//  Created by Stanislav on 31.01.2020.
//  Copyright © 2020 Stanislav. All rights reserved.
//


/*
 
 https://gist.github.com/nazywamsiepawel/0166e8a71d74e96c7898

 https://gist.github.com/nazywamsiepawel/0166e8a71d74e96c7898
 https://medium.com/@matschmidy/swift-custom-navigation-bar-image-for-ios-11-large-titles-8a176d9cbaed

 https://stackoverflow.com/questions/30993386/ios-rightbarbuttonitem-on-uinavigationcontroller-in-swift
 https://stackoverflow.com/questions/32553197/show-hide-barbuttonitem
 https://stackoverflow.com/questions/30022780/uibarbuttonitem-in-navigation-bar-programmatically
 https://stackoverflow.com/questions/37552876/swift-custom-navbar-back-button-image-and-text
 https://stackoverflow.com/questions/46193204/custom-back-indicator-image-and-ios-11
 https://stackoverflow.com/questions/24769770/swift-setting-back-button-image-in-nav-bar/44970293#44970293
 https://medium.com/simple-swift-programming-tips/how-to-make-custom-uinavigationcontroller-back-button-image-without-title-swift-7ea5673d7e03
 https://stackoverflow.com/questions/43383493/swift-3-add-navigation-items-to-uinavigationcontroller-subclass
 https://stackoverflow.com/questions/28356333/navigation-bar-contents-not-showing
 https://medium.com/simple-swift-programming-tips/how-to-make-custom-uinavigationcontroller-back-button-image-without-title-swift-7ea5673d7e03
 https://developer.apple.com/documentation/uikit/uinavigationcontroller
 https://developer.apple.com/documentation/uikit/uinavigationitem/1624958-backbarbuttonitem
 https://www.codesd.com/item/swift-3-add-navigation-articles-to-subclass-uinavigationcontroller.html
 https://swiftwithmajid.com/2019/02/20/navigation-with-flow-controllers/
 https://stackoverflow.com/questions/45069477/swift-3-0-adding-a-right-button-to-navigation-bar
 https://stackoverflow.com/questions/28471164/how-to-set-back-button-text-in-swift
 https://stackoverflow.com/questions/24687238/changing-navigation-bar-color-in-swift

 https://github.com/alex-lenk/icie/tree/master/src/fonts
 
 */

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
        
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        
        self.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        
        self.navigationBar.backgroundColor = .green
    }
}

extension MainNavigation {
    
    func setTitle(title:String, subtitle:String) -> UIView {
        
            let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:0, height:0))
            
            titleLabel.backgroundColor = UIColor.clear
            titleLabel.textColor = UIColor.gray
            titleLabel.font = UIFont.boldSystemFont(ofSize: 27)
            titleLabel.text = title
            titleLabel.sizeToFit()
            
            let subtitleLabel = UILabel(frame: CGRect(x:0, y:20, width:0, height:0))
            subtitleLabel.backgroundColor = UIColor.clear
            subtitleLabel.textColor = UIColor.black
            subtitleLabel.font = UIFont.systemFont(ofSize: 12)
            subtitleLabel.text = subtitle
            subtitleLabel.sizeToFit()
            
            let titleView = UIView(frame: CGRect(x:0, y:0, width:max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height:200))
            titleView.addSubview(titleLabel)
            titleView.addSubview(subtitleLabel)
            
//            let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width
//
//            if widthDiff > 0 {
//                var frame = titleLabel.frame
//                frame.origin.x = widthDiff / 2
//                titleLabel.frame = frame.integral
//            } else {
//                var frame = subtitleLabel.frame
//                frame.origin.x = abs(widthDiff) / 2
//                titleLabel.frame = frame.integral
//            }
            
        titleView.backgroundColor = .yellow
        
            return titleView
    }
    
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
