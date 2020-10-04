//
//  BlackAlertController.swift
//  Monsters
//
//  Created by Oleksandr Karpenko on 04.10.2020.
//

import UIKit

class BlackAlertController: UIAlertController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setBackgroundColor(color: .black)
        setAlpha(0.8)
        setMessage(font: UIFont.systemFont(ofSize: 14), color: .white)
    }
    
}
