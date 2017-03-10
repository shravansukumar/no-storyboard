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
    var detailDescriptionLabel: UILabel! = nil
    var bottomWrapperView: UIView! = nil
    
    var descriptionString: String = "Test String"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupImageView()
        setupSummaryView()
        setupDetailDescriptionLabel()
        setupBottomWrapperView()
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
         summaryView = UIView(frame: CGRect(x: 0.0, y: Double(homeScreenImageView.frame.maxY), width: Double(self.view.frame.width), height: Double(self.view.frame.height * 0.160)))
        summaryView.backgroundColor = custonWhiteColor
        self.view.addSubview(summaryView)
        
        let dateLabel = UILabel()
        let titleLabel = UILabel()
        let locationLabel = UILabel()
        let clockLabel = UILabel()
        
        let locationImage = #imageLiteral(resourceName: "location_image")
        let locationImageView = UIImageView(image: locationImage)
        
        let clockImage = #imageLiteral(resourceName: "clock_image")
        let clockImageView = UIImageView(image: clockImage)
        
        dateLabel.textAlignment = .center
        dateLabel.numberOfLines = 0
        dateLabel.text = "MON 13th MAR"
        
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.text = "2017 Holi - Rang Munch"
        
        locationLabel.textAlignment = .left
        locationLabel.numberOfLines = 0
        locationLabel.text = "at Pebble- The Jungle Lounge, Bengaluru"
        locationLabel.adjustsFontSizeToFitWidth = true
        locationLabel.font = locationLabel.font.withSize(12)
        
        clockLabel.textAlignment = .left
        clockLabel.text = "10 AM"
        
        
        summaryView.addSubview(titleLabel)
        summaryView.addSubview(dateLabel)
        summaryView.addSubview(locationImageView)
        summaryView.addSubview(locationLabel)
        summaryView.addSubview(clockImageView)
        summaryView.addSubview(clockLabel)
        
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        clockImageView.translatesAutoresizingMaskIntoConstraints = false
        clockLabel.translatesAutoresizingMaskIntoConstraints = false

        // MARK: - Date Label Constraints
        let dateLabelHorizontalConstraint = NSLayoutConstraint(item: dateLabel, attribute: .leading, relatedBy: .equal, toItem: summaryView, attribute: .leadingMargin, multiplier: 1.0, constant: 5.0)
        let dateLabelVerticalConstraint = NSLayoutConstraint(item: dateLabel, attribute: .top, relatedBy: .equal, toItem: summaryView,
            attribute: .topMargin, multiplier: 1.0, constant: 0.0)
        let dateLabelHeightConstraint = NSLayoutConstraint(item: dateLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80.0)
        let dateLabelWidthConstraint = NSLayoutConstraint(item: dateLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 45.0)
        
        // MARK: - Title Label constraints
        let titleLabelHorizontalConstraint = NSLayoutConstraint(item: summaryView, attribute: .trailingMargin, relatedBy: .equal, toItem: titleLabel, attribute: .trailing, multiplier: 1.0, constant: 90.0)
        let titleLabelVerticalConstraint = NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: summaryView, attribute: .top, multiplier: 1.0, constant: 15.0)
        
        // MARK: - Location Image View constraints
        let locationImageViewHeightConstraint = NSLayoutConstraint(item: locationImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0)
        let locationImageViewWidthConstraint = NSLayoutConstraint(item: locationImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0)
        let locationImageViewTopConstraint = NSLayoutConstraint(item: locationImageView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 8)
        let locationImageViewLeadingConstraint = NSLayoutConstraint(item: locationImageView, attribute: .leading, relatedBy: .equal, toItem: titleLabel, attribute: .leading, multiplier: 1.0, constant: 0)
        
        // MARK: - Location Label constraints
        let locationLabelLeadingConstraint = NSLayoutConstraint(item: locationLabel, attribute: .leading, relatedBy: .equal, toItem: locationImageView, attribute: .trailing, multiplier: 1.0, constant: 2.0)
        let locationLabelCenterConstraint = NSLayoutConstraint(item: locationLabel, attribute: .centerY, relatedBy: .equal, toItem: locationImageView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        // MARK: - Clock Image View Constraints
        let clockImageViewHeightConstraint = NSLayoutConstraint(item: clockImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0)
        let clockImageViewWidthConstraint = NSLayoutConstraint(item: clockImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0)
        let clockImageViewLeadingConstraint = NSLayoutConstraint(item: clockImageView, attribute: .leading, relatedBy: .equal, toItem: locationImageView, attribute: .leading, multiplier: 1.0, constant: 0)
        let clockImageViewTopConstraint = NSLayoutConstraint(item: clockImageView, attribute: .top, relatedBy: .equal, toItem: locationImageView, attribute: .bottom, multiplier: 1.0, constant: 8)
        
        // MARK: - Clock Label constraints
        let clockLabelLeadingConstraint =  NSLayoutConstraint(item: clockLabel, attribute: .leading, relatedBy: .equal, toItem: clockImageView, attribute: .trailing, multiplier: 1.0, constant: 2.0)
        let clockLabelCenterConstraint = NSLayoutConstraint(item: clockLabel, attribute: .centerY, relatedBy: .equal, toItem: clockImageView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        let constraintsArray = [dateLabelHorizontalConstraint, dateLabelVerticalConstraint, dateLabelHeightConstraint, dateLabelWidthConstraint, titleLabelHorizontalConstraint, titleLabelVerticalConstraint, locationImageViewHeightConstraint, locationImageViewWidthConstraint, locationImageViewTopConstraint, locationImageViewLeadingConstraint, locationLabelLeadingConstraint, locationLabelCenterConstraint, clockImageViewWidthConstraint, clockImageViewHeightConstraint, clockImageViewTopConstraint, clockImageViewLeadingConstraint, clockLabelLeadingConstraint, clockLabelCenterConstraint]

        summaryView.addConstraints(constraintsArray)
    }
    
    func setupDetailDescriptionLabel() {
        detailDescriptionLabel = UILabel(frame: CGRect(x: 0, y: Double(summaryView.frame.maxY), width: Double(self.view.frame.width), height: Double(self.view.frame.height * 0.45)))
        detailDescriptionLabel.numberOfLines = 0
        detailDescriptionLabel.text = descriptionString
        self.view.addSubview(detailDescriptionLabel)
    }
    
    func setupBottomWrapperView() {
        bottomWrapperView = UIView(frame: CGRect(x: 0, y: Double(detailDescriptionLabel.frame.maxY), width: Double(self.view.frame.width), height: Double(self.view.frame.height - detailDescriptionLabel.frame.maxY)))
        bottomWrapperView.backgroundColor = UIColor.black
        self.view.addSubview(bottomWrapperView)
        
        let ticketsButton = UIButton(type: .roundedRect)
        ticketsButton.setTitle("Book Tickets", for: .normal)
        ticketsButton.setTitleColor(UIColor.black, for: .normal)
        ticketsButton.translatesAutoresizingMaskIntoConstraints = false
        ticketsButton.backgroundColor = UIColor.yellow
        bottomWrapperView.addSubview(ticketsButton)
        ticketsButton.addTarget(self, action: #selector(bookTicketsTapped), for: .touchUpInside)
        
        // MARK: - Book tickets button constraints
        let ticketsButtonTrailingConstraint = NSLayoutConstraint(item: bottomWrapperView, attribute: .trailing, relatedBy: .equal, toItem: ticketsButton, attribute: .trailing, multiplier: 1.0, constant: 10)
        let ticketsButtonAlignConstraint = NSLayoutConstraint(item: ticketsButton, attribute: .centerY, relatedBy: .equal, toItem: bottomWrapperView, attribute: .centerY, multiplier: 1.0, constant: 0)
        bottomWrapperView.addConstraints([ticketsButtonTrailingConstraint, ticketsButtonAlignConstraint])
    }
    
     func bookTicketsTapped() {
        let ticketsViewController = TicketsViewController()
        self.navigationController?.pushViewController(ticketsViewController, animated: true)
    }
}

