//
//  URL+Extensions.swift
//  NASA APOD
//
//  Created by Vinay Kumar Thapa on 2022-12-05.
//

import Foundation


extension URL {
    
    static func nasaApodURL() -> URL? {
        return URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(Constants.API_KEY)")
    }
    
}
