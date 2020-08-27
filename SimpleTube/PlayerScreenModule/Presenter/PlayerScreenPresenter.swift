//
//  PlayerScreenViewPresenter.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 28.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import Foundation
import UIKit

protocol PlayerScreenProtocol: class {
    func proceed()
}

protocol PlayerScreenPresenterProtocol: class {
    init(view: PlayerScreenProtocol)
}

class PlayerScreenPresenter: PlayerScreenPresenterProtocol {
    
    weak var view: PlayerScreenProtocol?
    
    let networkManager = NetworkManager()
    
    required init(view: PlayerScreenProtocol) {
        self.view = view
    }
}
