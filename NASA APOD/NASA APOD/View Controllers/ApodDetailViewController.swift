//
//  ApodDetailViewController.swift
//  NASA APOD
//
//  Created by Vinay Kumar Thapa on 2022-12-05.
//

import UIKit

class ApodDetailViewController: UIViewController {

    var hdImageUrl = ""
    
    @IBOutlet weak var apodHDImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        apodHDImgView.sd_setImage(with: URL(string: self.hdImageUrl), placeholderImage: UIImage(named: "placeholder"))
    }
  

}
