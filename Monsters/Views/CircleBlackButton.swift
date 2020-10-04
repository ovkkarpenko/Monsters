//
//  CircleBlackButton.swift
//  Monsters
//
//  Created by Oleksandr Karpenko on 04.10.2020.
//

import UIKit

@IBDesignable
class CircleBlackButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 17
        backgroundColor = .black
        tintColor = .white
        alpha = 0.7
    }
    
}
