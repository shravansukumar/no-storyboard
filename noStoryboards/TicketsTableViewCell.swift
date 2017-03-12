//
//  TicketsTableViewCell.swift
//  noStoryboards
//
//  Created by Shravan Sukumar on 11/03/17.
//  Copyright © 2017 shravan. All rights reserved.
//

import UIKit

class TicketsTableViewCell: UITableViewCell {

    // MARK: - Variables
    var ticketTypeLabel = UILabel()
    var priceLabel = UILabel()
    var lastDateLabel = UILabel()
    var bottomSeperatorView = UIView()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(ticketTypeLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(lastDateLabel)
        self.contentView.addSubview(bottomSeperatorView)
        
        bottomSeperatorView.backgroundColor = UIColor.lightGray
        
        ticketTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        lastDateLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomSeperatorView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // MARK: - Ticket Type Label Constraints
        let ticketTypeLabelLeadingConstraint = NSLayoutConstraint(item: ticketTypeLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20)
        let ticketTypeLabelTopConstraint = NSLayoutConstraint(item: ticketTypeLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 20)
        
        // MARK: - Price Label Constraints
        let priceLabelLeadingConstraint = NSLayoutConstraint(item: priceLabel, attribute: .leading, relatedBy: .equal, toItem: ticketTypeLabel, attribute: .leading, multiplier: 1.0, constant: 0)
        let priceLabelTopConstraint = NSLayoutConstraint(item: priceLabel, attribute: .top, relatedBy: .equal, toItem: ticketTypeLabel, attribute: .bottom, multiplier: 1, constant: 10)
        
        // MARK: - Last Date Label Constraints
        let lastDateLabelBaseLineConstraint = NSLayoutConstraint(item: lastDateLabel, attribute: .lastBaseline, relatedBy: .equal, toItem: priceLabel, attribute: .lastBaseline, multiplier: 1, constant: 0)
        let lastDateLabelLeadingConstraint = NSLayoutConstraint(item: lastDateLabel, attribute: .leading, relatedBy: .equal, toItem: priceLabel, attribute: .trailing, multiplier: 1, constant: 15)
        
        // MARK: - Bottom Seperator View Constraints
        let bottomViewTrailingConstraint = NSLayoutConstraint(item: bottomSeperatorView, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1, constant: 0)
        let bottomViewLeadingConstraint = NSLayoutConstraint(item: self.contentView, attribute: .leading, relatedBy: .equal, toItem: bottomSeperatorView, attribute: .leading, multiplier: 1, constant: 0)
        let bottomViewBottomConstraint = NSLayoutConstraint(item: self.contentView, attribute: .bottom, relatedBy: .equal, toItem: self.bottomSeperatorView, attribute: .bottom, multiplier: 1, constant: 0)
        let bottomViewHeightConstraint = NSLayoutConstraint(item: bottomSeperatorView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1)
        
        let constraintsArray = [ticketTypeLabelLeadingConstraint, ticketTypeLabelTopConstraint, priceLabelLeadingConstraint, priceLabelTopConstraint, lastDateLabelBaseLineConstraint, lastDateLabelLeadingConstraint, bottomViewBottomConstraint, bottomViewHeightConstraint, bottomViewLeadingConstraint, bottomViewTrailingConstraint]
        self.contentView.addConstraints(constraintsArray)
    }


}
