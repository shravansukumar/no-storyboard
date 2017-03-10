//
//  TicketsViewController.swift
//  noStoryboards
//
//  Created by Shravan Sukumar on 10/03/17.
//  Copyright © 2017 shravan. All rights reserved.
//

import UIKit

class TicketsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        self.view.backgroundColor = UIColor.white
    }
    
    func setupNavigation() {
        navigationItem.title = "Choose Tickets"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_button"), style: .done, target: self, action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image?.withRenderingMode(.alwaysOriginal)
    }
    func backButtonPressed() {
        self.navigationController!.popViewController(animated: true)
    }
}
