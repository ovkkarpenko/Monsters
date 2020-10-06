//
//  MapMapRouterInput.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import Foundation

protocol MapRouterInput {

    func openTeam(_ view: UIViewController)
    func openCamera(_ view: UIViewController, monster: Monster)
}
