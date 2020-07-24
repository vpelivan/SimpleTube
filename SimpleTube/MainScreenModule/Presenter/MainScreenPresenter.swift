//
//  MainScreenPresenter.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 17.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import Foundation
import UIKit

protocol MainScreenProtocol: class {
    var searchController: UISearchController? { get set }
    func proceed()
}

protocol MainScreenPresenterProtocol: class {
    init(view: MainScreenProtocol)
    
}

class MainScreenPresenter: MainScreenPresenterProtocol {

    weak var view: MainScreenProtocol?
    
    let networkManager = NetworkManager()
    
    required init(view: MainScreenProtocol) {
        self.view = view
    }
    
    
}
