//
//  Motorcycle.swift
//  MobiSharing ViewCode
//
//  Created by Jonathan Bijos on 14/03/18.
//  Copyright © 2018 DevsCarioca. All rights reserved.
//

import UIKit

struct Motorcycle {
    let image: UIImage
    let name: String
    let type: MotorcycleType
}

enum MotorcycleType: String {
    case sport = "Sport bike"
    case bigTrail = "Big Trail"
    case custom = "Custom"
}
