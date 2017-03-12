//
//  TicketsViewController.swift
//  noStoryboards
//
//  Created by Shravan Sukumar on 10/03/17.
//  Copyright © 2017 shravan. All rights reserved.
//

import UIKit

class TicketsViewController: UIViewController {
    
    // MARK: - Variables and constants
    var tableView : UITableView!
    var bottomWrapperView: UIView! = nil
    var proceedButton = UIButton()
    var totalTicketsLabel = UILabel()
    var staticTotalTicketsLabel = UILabel()

    var eventDictionary = [
        ["ticketType": "Early Bird Couple", "price": "999", "lastDate": "ends in 13th march"],
        ["ticketType": "Early Bird Stag", "price": "799", "lastDate": "ends in 14th march"],
        ["ticketType": "Early Bird Girls", "price": "499", "lastDate": "ends in 14th march"],
    ]
    
    let cellReuseIdentifier = "TicketsTableViewReuseIdentifier"
    var sectionTitle: String = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        setupTableView()
        setupBottomWrapperView()
        self.view.backgroundColor = UIColor.white
    }
    
    // MARK: - Methods
    func setupNavigation() {
        navigationItem.title = "Choose Tickets"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_button"), style: .done, target: self, action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image?.withRenderingMode(.alwaysOriginal)
    }
    
    func setupTableView() {
        tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(TicketsTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.view.addSubview(tableView)
    }
    
    func setupBottomWrapperView() {
        bottomWrapperView = UIView()
        bottomWrapperView.translatesAutoresizingMaskIntoConstraints = false
        bottomWrapperView.backgroundColor = UIColor.black
        
        proceedButton.backgroundColor = UIColor.yellow
        proceedButton.isEnabled = false
        proceedButton.setTitleColor(UIColor.black, for: .normal)
        proceedButton.setTitle("Proceed", for: .normal)
        proceedButton.translatesAutoresizingMaskIntoConstraints = false
        proceedButton.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        
        totalTicketsLabel.text = "0"
        totalTicketsLabel.textColor = UIColor.white
        totalTicketsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        staticTotalTicketsLabel.text = "Ticket(s)"
        staticTotalTicketsLabel.textColor = UIColor.white
        staticTotalTicketsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - Bottom Wrapper View Constraints
        let bottomViewBottomConstraint = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .top, relatedBy: .equal, toItem: bottomWrapperView, attribute: .bottom, multiplier: 1, constant: 0)
        let bottomViewTrailingConstraint = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: bottomWrapperView, attribute: .trailing, multiplier: 1, constant: 0)
        let bottomViewLeadingConstraint = NSLayoutConstraint(item: bottomWrapperView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let bottomViewHeightConstraint = NSLayoutConstraint(item: bottomWrapperView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70)
        
        // MARK: - Proceed Button Constraints
        let proceedButtonTrailingConstraint = NSLayoutConstraint(item: bottomWrapperView, attribute: .trailing, relatedBy: .equal, toItem: proceedButton, attribute: .trailing, multiplier: 1, constant: 10)
        let proceedButtonCenterConstraint = NSLayoutConstraint(item: proceedButton, attribute: .centerY, relatedBy: .equal, toItem: bottomWrapperView, attribute: .centerY, multiplier: 1, constant: 0)
        
        // MARK: - Total Tickets Label Constraints
        let totalTicketsLeadingConstraint = NSLayoutConstraint(item: totalTicketsLabel, attribute: .leading, relatedBy: .equal, toItem: bottomWrapperView, attribute: .leading, multiplier: 1, constant: 10)
        let totalTicketsCenterConstraint = NSLayoutConstraint(item: totalTicketsLabel, attribute: .centerY, relatedBy: .equal, toItem: bottomWrapperView, attribute: .centerY, multiplier: 1, constant: 0)
        
        // MARK: - Static Total Tickets Label Constraints
        let staticTotalTicketsCenterConstraint = NSLayoutConstraint(item: staticTotalTicketsLabel, attribute: .centerY, relatedBy: .equal, toItem: bottomWrapperView, attribute: .centerY, multiplier: 1, constant: 0)
        let  staticTotalTicketsLeadingConstraint = NSLayoutConstraint(item: staticTotalTicketsLabel, attribute: .leading, relatedBy: .equal, toItem: totalTicketsLabel, attribute: .trailing, multiplier: 1, constant: 2)
        
        let bottomViewConstraintsArray = [bottomViewBottomConstraint,bottomViewTrailingConstraint, bottomViewLeadingConstraint,bottomViewHeightConstraint]
        let bottomWrapperViewElementsConstraintsArray = [proceedButtonTrailingConstraint, proceedButtonCenterConstraint, totalTicketsLeadingConstraint,totalTicketsCenterConstraint,staticTotalTicketsCenterConstraint, staticTotalTicketsLeadingConstraint]
        
        self.view.addSubview(bottomWrapperView)
        
        bottomWrapperView.addSubview(proceedButton)
        bottomWrapperView.addSubview(totalTicketsLabel)
        bottomWrapperView.addSubview(staticTotalTicketsLabel)
        
        self.view.addConstraints(bottomViewConstraintsArray)
        bottomWrapperView.addConstraints(bottomWrapperViewElementsConstraintsArray)
    }
    
    func backButtonPressed() {
        self.navigationController!.popViewController(animated: true)
    }
    
    func proceedButtonTapped() {
        let attendeeDetailsViewController = AttendeeDetailsViewController()
        navigationController?.pushViewController(attendeeDetailsViewController, animated: true)
    }
    

}

// MARK: - UITableViewDelegate
extension TicketsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle
    }
}

// MARK: - UITableViewDataSource
extension TicketsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventDictionary.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: 60))
        headerView.backgroundColor = UIColor.black
        
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 5, width: Int(self.view.frame.width), height: 20))
        headerLabel.text = sectionTitle
        headerLabel.textColor = UIColor.yellow
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! TicketsTableViewCell

        let cellObjects = eventDictionary[indexPath.row]
        cell.ticketTypeLabel.text = cellObjects["ticketType"]!
        cell.priceLabel.text = cellObjects["price"]!
        cell.lastDateLabel.text = cellObjects["lastDate"]!
        cell.delegate = self
        return cell
    }
}

// MARK: - TicketsTableViewCellDelegate
extension TicketsViewController: TicketsTableViewCellDelegate {
    
    func addTicket() {
        proceedButton.isEnabled = true
        var totalTickets = Int(totalTicketsLabel.text!)!
        totalTickets = totalTickets + 1
        totalTicketsLabel.text = String(totalTickets)
    }
    
    func removeTicket() {
        var totalTickets = Int(totalTicketsLabel.text!)!
        if totalTickets > 0 {
            totalTickets = totalTickets - 1
            totalTicketsLabel.text = String(totalTickets)
        } else {
            proceedButton.isEnabled = false
            totalTicketsLabel.text = String(0)
        }
    }
}


