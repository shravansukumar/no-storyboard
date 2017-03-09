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
    var summaryView: UIView! = nil
    var custonWhiteColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupImageView()
        setupSummaryView()
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
    
    func setupSummaryView() {
         summaryView = UIView(frame: CGRect(x: 0.0, y: Double(homeScreenImageView.frame.maxY), width: Double(self.view.frame.width), height: Double(self.view.frame.height * 0.2)))
        summaryView.backgroundColor = custonWhiteColor
        self.view.addSubview(summaryView)
        
        let dateLabel = UILabel()
        dateLabel.textAlignment = .center
        dateLabel.numberOfLines = 0
        dateLabel.text = "MON 13th MAR"
        summaryView.addSubview(dateLabel)
        
        let horizontalConstraint = NSLayoutConstraint(item: dateLabel, attribute: .leading, relatedBy: .equal, toItem: summaryView, attribute: .leadingMargin, multiplier: 1.0, constant: 5.0)
        let verticalConstraint = NSLayoutConstraint(item: dateLabel, attribute: .top, relatedBy: .equal, toItem: summaryView,
            attribute: .topMargin, multiplier: 1.0, constant: 0.0)
        let heightConstraint = NSLayoutConstraint(item: dateLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80.0)
        let widthConstraint = NSLayoutConstraint(item: dateLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40.0)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryView.addConstraints([horizontalConstraint, verticalConstraint, heightConstraint, widthConstraint])
    }
}

