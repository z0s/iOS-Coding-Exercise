//
//  ItunesTableViewCell.swift
//  JSON Exercise
//
//  Created by Zubair on 5/27/17.
//  Copyright © 2017 Zubair. All rights reserved.
//

import UIKit

class ItunesTableViewCell: UITableViewCell {
    static let reuseID = "ItunesCell"
    static let height: CGFloat = 70
    
    lazy var artworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var trackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    func setupView() {
        setupContainer()
        setupArtworkImageView()
        setupLabels()
        setupSeparator()
    }
    
    func setupContainer() {
        contentView.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    func setupArtworkImageView() {
        containerView.addSubview(artworkImageView)
        artworkImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        artworkImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        artworkImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        artworkImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
    }
    
    func setupLabels() {
        containerView.addSubview(trackLabel)
        containerView.addSubview(albumLabel)
        
        trackLabel.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 15).isActive = true
        trackLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -15).isActive = true
        trackLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        trackLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        
        albumLabel.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 15).isActive = true
        albumLabel.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: 5).isActive = true
        albumLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        albumLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
    }
    
    func setupSeparator() {
        containerView.addSubview(separator)
        
        separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
