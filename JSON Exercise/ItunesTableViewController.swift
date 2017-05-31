//
//  ItunesTableViewController.swift
//  JSON Exercise
//
//  Created by Zubair on 5/26/17.
//  Copyright © 2017 Zubair. All rights reserved.
//

import UIKit

class ItunesTableViewController: UIViewController {
    
    var results = [Track]()
    var apiManager = APIManager.shared
    
    override func loadView() {
        view = UIView()
        setupSubviews()
        populateTableview()
        
    }
    
    func populateTableview() {
        apiManager.retrieveItunesObjects { (objects) in
            self.results = objects
            if self.results.count > 0 {
                DispatchQueue.main.async {

                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func setupSubviews() {
        view.backgroundColor = .white
        title = "Michael Jackson"
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ItunesTableViewCell.self, forCellReuseIdentifier: ItunesTableViewCell.reuseID)
        tableView.separatorStyle = .none
        return tableView
    }()
    
}
extension ItunesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItunesTableViewCell.reuseID, for: indexPath) as? ItunesTableViewCell else {
            return UITableViewCell()
        }
        let item = results[indexPath.row]
        //Track Title
        if let trackName = item.trackName {
            cell.trackLabel.text = trackName
        }
        //Album Title
        if let albumName = item.albumName {
            cell.albumLabel.text = albumName
        }
        // Artwork Image View
        if let imageURLString: String = item.artworkUrl60 {
            if let imageURL = URL(string: imageURLString) {
                apiManager.requestImage(at: imageURL, completion: { (image) in
                    if let image = image {
                        cell.artworkImageView.image = image
                    }
                })
            }
        }
//        cell.selectionStyle = .none
        return cell
    }
}
extension ItunesTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ItunesTableViewCell.height
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ItunesDetailViewController()
        vc.track = results[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

