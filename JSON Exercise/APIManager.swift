//
//  APIManager.swift
//  JSON Exercise
//
//  Created by Zubair on 5/27/17.
//  Copyright © 2017 Zubair. All rights reserved.
//

import UIKit

class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    func retrieveItunesObjects(completionHandler: @escaping ([Track]) -> ()) {
        var trackResults = [Track]()
        let urlString =  "https://itunes.apple.com/search?term=Michael+jackson"
        let session = URLSession.shared
        guard let url = URL(string: urlString) else {
            return print("url is returning an error.")
            
        }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            func displayError(_ error: String) {
                print(error)
                print("URL at time of error: \(url)")
            }
            
            guard error == nil else {
                displayError("There was an error with your request: \(String(describing: error))")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                displayError("Your request returned a status code other than 2xx!")
                return
            }
            
            guard let data = data else {
                displayError("No data was returned by the request!")
                return
            }
            
            let parsedResult: [String:AnyObject]!
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
            } catch {
                displayError("Could not parae the data as JSON: '\(data)'")
                return
            }
            
            let trackArray = parsedResult["results"] as! [[String:AnyObject]]
            
            
            for track in trackArray {
                trackResults.append(Track(trackName: track[Constants.APIResponseKeys.trackName] as? String, albumName: track[Constants.APIResponseKeys.albumName] as? String, artistName: track[Constants.APIResponseKeys.artistName] as? String, previewUrl: track[Constants.APIResponseKeys.audioURL] as? String, artworkUrl60: track[Constants.APIResponseKeys.artworkURL60] as? String, artworkUrl100: track[Constants.APIResponseKeys.artworkURL100] as? String, trackViewURL: track[Constants.APIResponseKeys.trackViewUrl] as? String))
            }
            completionHandler(trackResults)
        }
        task.resume()
    }
    
    func requestImage(at imageURL: URL, completion: @escaping ((UIImage?) -> Void)) {
        let imageDownloadTask = URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, response, error) in
            var image: UIImage? = nil
            
            func displayError(_ error: String) {
                print(error)
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                displayError("Your request returned a status code other than 2xx!")
                return
            }
            
            if let imageData = data {
                image = UIImage(data: imageData)
            }
            DispatchQueue.main.async {
                completion(image)
            }
        })
        imageDownloadTask.resume()
    }
}
