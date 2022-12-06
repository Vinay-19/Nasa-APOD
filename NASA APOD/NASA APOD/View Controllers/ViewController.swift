//
//  ViewController.swift
//  NASA APOD
//
//  Created by Vinay Kumar Thapa on 2022-12-05.
//

import UIKit
import SDWebImage

class ViewController: BaseViewController {
    
    
    @IBOutlet weak var apodImgView: UIImageView!
    
    @IBOutlet weak var apodTitleView: UILabel!
    
    var networkManager = NetworkManager()
    var hdURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.delegate = self
        displayActivityIndicator(true)
        networkManager.performRequest()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        initialSetup()
    }

}
// MARK: - NetworkManagerDelegate

extension ViewController: NetworkManagerDelegate {
    func didUpdateNasaAPOD(apodData: NasaData) {
       
        DispatchQueue.main.async {
            self.displayActivityIndicator(false)
            self.apodImgView.sd_setImage(with: URL(string: apodData.url), placeholderImage: UIImage(named: "placeholder"))
            self.apodTitleView.text = apodData.title
//            self.apodHDImgView.sd_setImage(with: URL(string: apodData.hdurl), placeholderImage: UIImage(named: "placeholder"))
            self.hdURL = apodData.hdurl
            
            
        }

    }

    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
            self.displayActivityIndicator(false)
            self.apodImgView.image = UIImage(named: "placeholder")
            self.apodTitleView.text = "Please setup empty state"
        }
        print("*** Error Description ***", error)
    }
}

// MARK: - Initial UI Setup

extension ViewController {
    
    func initialSetup() {
        apodImgView.layer.cornerRadius = 50
        apodImgView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(photoTapped(tapGestureRecognizer:)))
        apodImgView.addGestureRecognizer(tapGestureRecognizer)
    }
}

// MARK: -  Photo Tapped

extension ViewController{
    
    @objc func photoTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        print("photo tapped")
       
        performSegue(withIdentifier: "goTo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goTo" {
            let destinationVC = segue.destination as! ApodDetailViewController
            destinationVC.hdImageUrl = self.hdURL

        }
    }
    
}
