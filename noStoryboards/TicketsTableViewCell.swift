//
//  TicketsTableViewCell.swift
//  noStoryboards
//
//  Created by Shravan Sukumar on 11/03/17.
//  Copyright © 2017 shravan. All rights reserved.
//

import UIKit

protocol TicketsTableViewCellDelegate: class {
    func addTicket()
    func removeTicket()
}

class TicketsTableViewCell: UITableViewCell {
    

    // MARK: - Variables
    var ticketTypeLabel = UILabel()
    var priceLabel = UILabel()
    var lastDateLabel = UILabel()
    var bottomSeperatorView = UIView()
    var ticketsView = UIView()
    var minusButton = UIButton()
    var plusButton = UIButton()
    var countLabel = UILabel()
    var defaultCountLabelText = 0
    weak var delegate: TicketsTableViewCellDelegate?
    
    
    
    // MARK: - Lifecycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(ticketTypeLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(lastDateLabel)
        self.contentView.addSubview(bottomSeperatorView)
        self.contentView.addSubview(ticketsView)
        self.ticketsView.addSubview(minusButton)
        self.ticketsView.addSubview(countLabel)
        self.ticketsView.addSubview(plusButton)
        
       // ticketsView.backgroundColor = UIColor.black
        bottomSeperatorView.backgroundColor = UIColor.lightGray
        
        ticketTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        lastDateLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomSeperatorView.translatesAutoresizingMaskIntoConstraints = false
        ticketsView.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        setupTicketsViewElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupTicketsViewElements() {
        minusButton.setImage(#imageLiteral(resourceName: "minus_button"), for: .normal)
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        
        plusButton.setImage(#imageLiteral(resourceName: "plus_button"), for: .normal)
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        countLabel.text = String(defaultCountLabelText)
        countLabel.font = countLabel.font.withSize(12)
        
        if countLabel.text == String(defaultCountLabelText) {
            minusButton.isEnabled = false
        }
    }
    
    func minusButtonTapped() {
        delegate?.removeTicket()
        var ticketCount = Int(countLabel.text!)
        if ticketCount == 0 {
            minusButton.isEnabled = false
        } else {
            ticketCount = ticketCount! - 1
            countLabel.text = String(ticketCount!)
        }
    }
    
    func plusButtonTapped() {
        delegate?.addTicket()
        if minusButton.isEnabled == false {
            minusButton.isEnabled = true
        }
        var ticketCount = Int(countLabel.text!)
        ticketCount = ticketCount! + 1
        countLabel.text = String(ticketCount!)
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
        
        // MARK: - Tickets View Constraints
        let ticketsViewWidthConstraint = NSLayoutConstraint(item: ticketsView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70)
        let ticketsViewHeightConstraint = NSLayoutConstraint(item: ticketsView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let ticketsViewCenterConstraint = NSLayoutConstraint(item: ticketsView, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0)
        let ticketsViewTrailingConstraint = NSLayoutConstraint(item: self.contentView, attribute: .trailing, relatedBy: .equal, toItem: ticketsView, attribute: .trailing, multiplier: 1, constant: 25)
        
        // MARK: - Minus Button Constraints
        let minusButtonWidthConstraint = NSLayoutConstraint(item: minusButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        let minusButtonHeightConstraint = NSLayoutConstraint(item: minusButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        let minusButtonLeadingConstraint = NSLayoutConstraint(item: minusButton, attribute: .leading, relatedBy: .equal, toItem: ticketsView, attribute: .leading, multiplier: 1, constant: 5)
        let minusButtonCenterConstraint = NSLayoutConstraint(item: minusButton, attribute: .centerY, relatedBy: .equal, toItem: ticketsView, attribute: .centerY, multiplier: 1, constant: 0)
        
        // MARK: - Count Label Constraints
        let countLabelLeadingConstraints = NSLayoutConstraint(item: countLabel, attribute: .leading, relatedBy: .equal, toItem: minusButton, attribute: .leading, multiplier: 1, constant: 30)
        let countLabelCenterConstraint = NSLayoutConstraint(item: countLabel, attribute: .centerY, relatedBy: .equal, toItem: ticketsView, attribute: .centerY, multiplier: 1, constant: 0)
        let countLabelWidthConstraint = NSLayoutConstraint(item: countLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10)
    
        
        // MARK: - Plus Button Constraints
        let plusButtonWidthConstraint = NSLayoutConstraint(item: plusButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        let plusButtonHeightConstraint = NSLayoutConstraint(item: plusButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        let plusButtonLeadingConstraints = NSLayoutConstraint(item: plusButton, attribute: .leading, relatedBy: .equal, toItem: countLabel, attribute: .trailing, multiplier: 1, constant: 10)
        let plusButtonCenterConstraint = NSLayoutConstraint(item: plusButton, attribute: .centerY, relatedBy: .equal, toItem: ticketsView, attribute: .centerY, multiplier: 1, constant: 0)
        
        // Tickets View Constraints
        let ticketViewConstraintArray = [minusButtonWidthConstraint, minusButtonHeightConstraint, minusButtonCenterConstraint, minusButtonLeadingConstraint, countLabelLeadingConstraints, countLabelCenterConstraint, countLabelWidthConstraint, plusButtonWidthConstraint, plusButtonCenterConstraint, plusButtonHeightConstraint, plusButtonLeadingConstraints]
        self.ticketsView.addConstraints(ticketViewConstraintArray)
        
        // Content View Constraint
        let constraintsArray = [ticketTypeLabelLeadingConstraint, ticketTypeLabelTopConstraint, priceLabelLeadingConstraint, priceLabelTopConstraint, lastDateLabelBaseLineConstraint, lastDateLabelLeadingConstraint, bottomViewBottomConstraint, bottomViewHeightConstraint, bottomViewLeadingConstraint, bottomViewTrailingConstraint, ticketsViewWidthConstraint, ticketsViewCenterConstraint, ticketsViewHeightConstraint, ticketsViewTrailingConstraint]
        self.contentView.addConstraints(constraintsArray)
    }


}
