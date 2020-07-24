//
//  Animations.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 21.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import Foundation
import UIKit

class Animations {
    
    public func slideObjectFromSide(withDuration duration: Double, delay: Double, completion: @escaping () -> ()) {
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            completion()
        })
    }
}
