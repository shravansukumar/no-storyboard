//
//  ViewController.swift
//  noStoryboards
//
//  Created by Shravan Sukumar on 08/03/17.
//  Copyright © 2017 shravan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables
    var homeScreenImageView: UIImageView! = nil
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupImageView()
        self.view.backgroundColor = UIColor.white
    }
    
    // MARK: - Methods
    func setupNavigation() {
        navigationItem.title = "2017 Holi - Rang Munch"
    }
    
    func setupImageView() {
        let navigationBarHeight = Double((self.navigationController?.navigationBar.frame.height)!)
        let homeScreenImage = UIImage(named: "homepage_image")
        homeScreenImageView = UIImageView(image: homeScreenImage!)
        homeScreenImageView.frame = CGRect(x: 0.0, y: navigationBarHeight + 10.0, width: (Double(self.view.frame.width)), height: Double(self.view.frame.height * 0.2))
        view.addSubview(homeScreenImageView)
    }
}

