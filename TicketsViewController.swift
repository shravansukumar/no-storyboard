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
        self.view.backgroundColor = UIColor.white
        
    }
    
    // MARK: - Methods
    func setupNavigation() {
        navigationItem.title = "Choose Tickets"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_button"), style: .done, target: self, action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image?.withRenderingMode(.alwaysOriginal)
    }
    
    func backButtonPressed() {
        self.navigationController!.popViewController(animated: true)
    }
    
    func setupTableView() {
        tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(TicketsTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.view.addSubview(tableView)
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
        return cell
    }
}


