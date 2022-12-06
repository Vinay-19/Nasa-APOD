//
//  ViewController.swift
//  NASA APOD
//
//  Created by Vinay Kumar Thapa on 2022-12-05.
//

import UIKit

class ViewController: UIViewController {
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.delegate = self
        networkManager.performRequest()
    }


}

extension ViewController: NetworkManagerDelegate {
    func didUpdateNasaAPOD(apodData: NasaData) {
        print(apodData.title)
        print(apodData.url)
        print(apodData.hdurl)
    }

    func didFailWithError(error: Error) {
        print(error)
    }
}

