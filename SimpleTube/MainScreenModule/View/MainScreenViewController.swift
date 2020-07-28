//
//  MainScreenViewController.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 15.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, MainScreenProtocol, UISearchControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
       
    var presenter: MainScreenPresenterProtocol!
    var searchController: UISearchController?
    
    
    //MARK: - Lyfecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Simple Tube"
        tableView.delegate = self
        tableView.dataSource = self
        let videoNib = UINib(nibName: "VideoTableViewCell", bundle: nil)
        tableView.register(videoNib, forCellReuseIdentifier: "videoCell")
        let palylistNib = UINib(nibName: "PlaylistTableViewCell", bundle: nil)
        tableView.register(palylistNib, forCellReuseIdentifier: "playlistCell")
        let channelNib = UINib(nibName: "ChannelTableViewCell", bundle: nil)
        tableView.register(channelNib, forCellReuseIdentifier: "channelCell")
        tableView.tableFooterView = UIView(frame: .zero)
        setupSearchBar()
        searchController?.delegate = self
    }
    
    private func setupSearchBar() {
        
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.obscuresBackgroundDuringPresentation = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(tapLogOut))
//            UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(addTapped))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        searchController?.searchBar.placeholder = "Search Anything"
    }
    
    @objc func tapLogOut() {
        self.dismiss(animated: true, completion: nil)
    }

    //MARK: - Public Methods
       
       public func proceed() {
           tableView.reloadData()
       }

}

extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideoTableViewCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath) as! PlaylistTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as! ChannelTableViewCell
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension MainScreenViewController: UITableViewDelegate {
    
}

extension MainScreenViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
//        presenter.performSearch(from: searchController.searchBar.text!)
        proceed()
    }
}

extension MainScreenViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let movieText = searchBar.text?.lowercased() else { return }
//        presenter.performSearch(from: movieText)
        proceed()
    }
}
