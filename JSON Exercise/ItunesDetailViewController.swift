//
//  ItunesDetailViewController.swift
//  JSON Exercise
//
//  Created by Zubair on 5/27/17.
//  Copyright © 2017 Zubair. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ItunesDetailViewController: UIViewController {
    
    var track:Track?
    
    override func loadView() {
        addSubviews()
    }
    
    func addSubviews() {
        view = UIView()
        view.backgroundColor = .white
        setTitle()
        setupImageView()
        setupSampleButton()
        setupSeeMoreButton()
        setupAlbumLabel()
    }
    
    func setTitle() {
        guard let titleString = track?.trackName else {
            return
        }
        title = titleString
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -90).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        if let imageURLString: String = track?.artworkUrl100 {
            if let imageURL = URL(string: imageURLString) {
                if let imageData = try? Data(contentsOf: imageURL) {
                    imageView.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    func setupSampleButton() {
        view.addSubview(playAudioButton)
        playAudioButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
        playAudioButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playAudioButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        playAudioButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func setupSeeMoreButton() {
        view.addSubview(seeMoreButton)
        seeMoreButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70).isActive = true
        seeMoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        seeMoreButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        seeMoreButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func setupAlbumLabel() {
        view.addSubview(albumLabel)
        albumLabel.text = track?.albumName
        albumLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -235).isActive = true
        albumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        albumLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        albumLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
    func handlePlay() {
        playDownload(track!)
    }
    
    func seeInItunes() {
        if let urlString = track?.trackViewURL?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            }
    }
    
    func playDownload(_ track: Track) {
        if let urlString = track.previewUrl {
            if let url = URL(string: urlString) {
                let player = AVPlayer(url: url)
                let playerVC = AVPlayerViewController()
                playerVC.player = player
                present(playerVC, animated: true) {
                    playerVC.player!.play()
                }
            }
            
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var playAudioButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Listen", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        return button
    }()
    
    lazy var seeMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See More", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(seeInItunes), for: .touchUpInside)
        return button
    }()
    
    lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}
