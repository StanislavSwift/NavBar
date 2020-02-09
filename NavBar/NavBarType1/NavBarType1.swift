//
//  NavBarType1.swift
//  NavBar
//
//  Created by Vonavi on 10.02.2020.
//  Copyright © 2020 Stanislav. All rights reserved.
//

import UIKit

extension UILabel {
    func sizeToFitHeight() {
        let size: CGSize = self.sizeThatFits(CGSize.init(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        var frame:CGRect = self.frame
        frame.size.height = size.height
        self.frame = frame
    }
}

final class NavBarType1: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var backButtonView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var rightButtonsView: UIView!
    @IBOutlet private weak var rightButtonsStack: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    override required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func test() {
        self.titleLabel.sizeToFitHeight()
        debugPrint()
    }
}

private extension NavBarType1 {
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: NavBarType1.self), owner: self, options: nil)
        addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        
    }
}
