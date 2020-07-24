//
//  MainScreenViewController.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 15.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, MainScreenProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
       
    var presenter: MainScreenPresenterProtocol!
    var searchController: UISearchController?
    
    
    //MARK: - Lyfecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Simple Tube"
        let searchNib = UINib(nibName: "PlaylistTableViewCell", bundle: nil)
        tableView.register(searchNib, forCellReuseIdentifier: "searchCell")
        tableView.tableFooterView = UIView(frame: .zero)
    }

    //MARK: - Public Methods
       
       public func proceed() {
           tableView.reloadData()
       }

}

extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        return cell
    }
    
    
}

extension MainScreenViewController: UITableViewDelegate {
    
}
