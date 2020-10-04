//
//  BlackButton.swift
//  Monsters
//
//  Created by Oleksandr Karpenko on 04.10.2020.
//

import UIKit

@IBDesignable
class BlackButton: UIButton {

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
        layer.cornerRadius = 10
        backgroundColor = .black
        alpha = 0.8
    }
    
}
