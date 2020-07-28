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
    
    func performButtonAnimation(withDuration duration: Double, delay: Double, for button: UIButton?) {
        slideObjectFromSide(withDuration: duration, delay: delay) {
            button!.transform = .identity
            button!.alpha = 1
        }
    }
    
    func performImageViewAnimation(withDuration duration: Double, delay: Double, for imageView: UIImageView?) {
        slideObjectFromSide(withDuration: duration, delay: delay) {
            imageView!.transform = .identity
            imageView!.alpha = 1
        }
    }
    
    func performLabelAnimation(withDuration duration: Double, delay: Double, for label: UILabel?) {
        slideObjectFromSide(withDuration: duration, delay: delay) {
            label!.transform = .identity
            label!.alpha = 1
        }
    }
}
