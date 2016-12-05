//
//  Button.swift
//  BusinessCard
//
//  Created by walter scott on 12/5/16.
//  Copyright © 2016 mk. All rights reserved.
//

import Foundation
import UIKit
class PrimaryButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBorderWidth(4.0, for: .normal)
        setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), for: .normal)
        setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), for: .highlighted)
        setBorderColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), for: .normal)
        setScale(0.98, for: .highlighted)
        setTitleColor(UIColor.white, for: .normal)
    }
}

