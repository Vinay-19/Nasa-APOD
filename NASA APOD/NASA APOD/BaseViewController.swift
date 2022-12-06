//
//  BaseViewController.swift
//  NASA APOD
//
//  Created by Vinay Kumar Thapa on 2022-12-05.
//

import Foundation
import UIKit

public class BaseViewController: UIViewController {
    let activityIndicator: UIActivityIndicatorView = {
        
        let activityIndicator    = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.color  = UIColor.darkGray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityIndicator)
    }
    
    func displayActivityIndicator(_ display: Bool) {
        if display {
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
}
