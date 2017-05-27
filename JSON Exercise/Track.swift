//
//  Track.swift
//  JSON Exercise
//
//  Created by Zubair on 5/26/17.
//  Copyright © 2017 Zubair. All rights reserved.
//

import UIKit

class Track {
    var trackName: String?
    var albumName: String?
    var artistName: String?
    var previewUrl: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var trackViewURL: String?
    
    
    init(trackName: String?, albumName: String?, artistName: String?, previewUrl: String?, artworkUrl60: String?, artworkUrl100: String?, trackViewURL: String?) {
        self.trackName = trackName
        self.albumName = albumName
        self.artistName = artistName
        self.previewUrl = previewUrl
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100
        self.trackViewURL = trackViewURL
    }
}
