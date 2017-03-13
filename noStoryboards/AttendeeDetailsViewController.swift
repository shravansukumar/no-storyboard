//
//  AttendeeDetailsViewController.swift
//  noStoryboards
//
//  Created by Shravan Sukumar on 13/03/17.
//  Copyright © 2017 shravan. All rights reserved.
//

import UIKit

class AttendeeDetailsViewController: UIViewController, UITextFieldDelegate {
    
    
    var nameTextField = UITextField()
    var emailTextField = UITextField()
    var phoneNumberTextField = UITextField()
    var topView: UIView! = nil
    
    var totalTickets: String = "test"
    var custonWhiteColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
   

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        setupNavigation()
        setupTopView()
        setupTextFields()
        setupBottomWrapperView()
    }
    
    func setupNavigation() {
        navigationItem.title = "Attendee Details"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_button"), style: .done, target: self, action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image?.withRenderingMode(.alwaysOriginal)
    }
    
    func backButtonPressed() {
        self.navigationController!.popViewController(animated: true)
    }
    
    func setupTopView() {
        let navigationBarHeight = Double((self.navigationController?.navigationBar.frame.height)!)
        let totalTicketsLabel = UILabel()
        
        topView = UIView(frame: CGRect(x: 0, y: navigationBarHeight + 10, width: Double(self.view.frame.width), height: Double(self.view.frame.height * 0.1)))
        totalTicketsLabel.translatesAutoresizingMaskIntoConstraints = false
        totalTicketsLabel.text = totalTickets + " Ticket(s)"
        totalTicketsLabel.textAlignment = .left
        totalTicketsLabel.numberOfLines = 1
        
        topView.backgroundColor = custonWhiteColor
        self.view.addSubview(topView)
        self.topView.addSubview(totalTicketsLabel)
        
        // MARK : - Total Tickets Label Constraints 
        let totalTicketsCenterConstraint = NSLayoutConstraint(item: totalTicketsLabel, attribute: .centerY, relatedBy: .equal, toItem: topView, attribute: .centerY, multiplier: 1, constant: 0)
        let totalTicketsLeadingConstraint = NSLayoutConstraint(item: totalTicketsLabel, attribute: .leading, relatedBy: .equal, toItem: topView, attribute: .leading, multiplier: 1, constant: 10)
        
        let topViewConstraintsArray = [totalTicketsCenterConstraint,totalTicketsLeadingConstraint]
        topView.addConstraints(topViewConstraintsArray)
    }
    
    func setupTextFields() {
        let nameTextFieldBottomView = UIView()
        let phoneNumberTextFieldBottomView = UIView()
        let emailTextFieldBottomView = UIView()
        
        
        
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextFieldBottomView.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextFieldBottomView.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldBottomView.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField.borderStyle = .none
        nameTextField.autocorrectionType = UITextAutocorrectionType.no
        nameTextField.returnKeyType = UIReturnKeyType.done
        nameTextField.keyboardType = UIKeyboardType.default
        nameTextField.placeholder = "Enter Your Full Name"
        nameTextField.delegate = self

        emailTextField.borderStyle = .none
        emailTextField.autocorrectionType = UITextAutocorrectionType.no
        emailTextField.returnKeyType = UIReturnKeyType.done
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        emailTextField.placeholder = "Your email id"
        emailTextField.delegate = self

        phoneNumberTextField.borderStyle = .none
        phoneNumberTextField.autocorrectionType = UITextAutocorrectionType.no
        phoneNumberTextField.returnKeyType = UIReturnKeyType.done
        phoneNumberTextField.keyboardType = UIKeyboardType.phonePad
        phoneNumberTextField.placeholder = "Your Phone Number"
        phoneNumberTextField.delegate = self

        
        nameTextFieldBottomView.backgroundColor = UIColor.black
        emailTextFieldBottomView.backgroundColor = UIColor.black
        phoneNumberTextFieldBottomView.backgroundColor = UIColor.black
        
        self.view.addSubview(nameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(phoneNumberTextField)
        self.view.addSubview(nameTextFieldBottomView)
        self.view.addSubview(emailTextFieldBottomView)
        self.view.addSubview(phoneNumberTextFieldBottomView)
        
        // MARK : - Name TextField Constraints
        let nameTextLeadingConstraint = NSLayoutConstraint(item: nameTextField, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 20)
        let nameTextTrailingConstraint = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: nameTextField, attribute: .trailing, multiplier: 1, constant: 20)
        let nameTextTopConstraint = NSLayoutConstraint(item: nameTextField, attribute: .top, relatedBy: .equal, toItem: topView, attribute: .bottom, multiplier: 1, constant: 20)
        
        // MARK : - Name Text Bottom View
        let nameTextBottomViewTopConstraint = NSLayoutConstraint(item: nameTextFieldBottomView, attribute: .top, relatedBy: .equal, toItem: nameTextField, attribute: .bottom, multiplier: 1, constant: 5)
        let nameTextBottomViewLeadingAlignConstraint =  NSLayoutConstraint(item: nameTextFieldBottomView, attribute: .leading, relatedBy: .equal, toItem: nameTextField, attribute: .leading, multiplier: 1, constant: 0)
        let nameTextBottomViewTrailingAlignConstraint =  NSLayoutConstraint(item: nameTextFieldBottomView, attribute: .trailing , relatedBy: .equal, toItem: nameTextField, attribute: .trailing, multiplier: 1, constant: 0)
        let nameTextBottomViewHeightConstraint = NSLayoutConstraint(item: nameTextFieldBottomView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1)
        
        // MARK: - Email TextField Constraints
        let emailTextFieldTopConstraint = NSLayoutConstraint(item: emailTextField, attribute: .top, relatedBy: .equal, toItem: nameTextFieldBottomView, attribute: .bottom, multiplier: 1, constant: 35)
        let emailLeadingAlignConstraint = NSLayoutConstraint(item: emailTextField, attribute: .leading, relatedBy: .equal, toItem: nameTextFieldBottomView, attribute: .leading, multiplier: 1, constant: 0)
        let emailTextFieldTrailingAlignConstraint =  NSLayoutConstraint(item: emailTextField, attribute: .trailing , relatedBy: .equal, toItem: nameTextFieldBottomView, attribute: .trailing, multiplier: 1, constant: 0)
        
        // MARK: - Email Text BottomView
        let emailTextBottomViewTopConstraint = NSLayoutConstraint(item: emailTextFieldBottomView, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 5)
        let emailTextBottomViewLeadingAlignConstraint =  NSLayoutConstraint(item: emailTextFieldBottomView, attribute: .leading, relatedBy: .equal, toItem: emailTextField, attribute: .leading, multiplier: 1, constant: 0)
        let emailTextBottomViewTrailingAlignConstraint =  NSLayoutConstraint(item: emailTextFieldBottomView, attribute: .trailing , relatedBy: .equal, toItem: emailTextField, attribute: .trailing, multiplier: 1, constant: 0)
        let emailTextBottomViewHeightConstraint = NSLayoutConstraint(item: emailTextFieldBottomView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1)
        
        // MARK : - Phone Number Text
        let phoneNumberTextFieldTopConstraint = NSLayoutConstraint(item: phoneNumberTextField, attribute: .top, relatedBy: .equal, toItem: emailTextFieldBottomView, attribute: .bottom, multiplier: 1, constant: 35)
        let phoneNumberLeadingAlignConstraint = NSLayoutConstraint(item: phoneNumberTextField, attribute: .leading, relatedBy: .equal, toItem: emailTextFieldBottomView, attribute: .leading, multiplier: 1, constant: 0)
        let phoneNumberTextFieldTrailingAlignConstraint =  NSLayoutConstraint(item: phoneNumberTextField, attribute: .trailing , relatedBy: .equal, toItem: emailTextFieldBottomView, attribute: .trailing, multiplier: 1, constant: 0)

        // MARK : - Phone Number BottomVIew
        let phoneNumberTextBottomViewTopConstraint = NSLayoutConstraint(item: phoneNumberTextFieldBottomView, attribute: .top, relatedBy: .equal, toItem: phoneNumberTextField, attribute: .bottom, multiplier: 1, constant: 5)
        let phoneNumberTextBottomViewLeadingAlignConstraint =  NSLayoutConstraint(item: phoneNumberTextFieldBottomView, attribute: .leading, relatedBy: .equal, toItem: phoneNumberTextField, attribute: .leading, multiplier: 1, constant: 0)
        let phoneNumberTextBottomViewTrailingAlignConstraint =  NSLayoutConstraint(item: phoneNumberTextFieldBottomView, attribute: .trailing , relatedBy: .equal, toItem: phoneNumberTextField, attribute: .trailing, multiplier: 1, constant: 0)
        let phoneNumberTextBottomViewHeightConstraint = NSLayoutConstraint(item: phoneNumberTextFieldBottomView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1)

        let textFieldConstraints = [nameTextLeadingConstraint,nameTextTopConstraint,nameTextTrailingConstraint, nameTextBottomViewTopConstraint, nameTextBottomViewLeadingAlignConstraint, nameTextBottomViewTrailingAlignConstraint, nameTextBottomViewHeightConstraint, emailTextFieldTopConstraint,emailLeadingAlignConstraint, emailTextFieldTrailingAlignConstraint,emailTextBottomViewTopConstraint, emailTextBottomViewLeadingAlignConstraint, emailTextBottomViewTrailingAlignConstraint, emailTextBottomViewHeightConstraint, phoneNumberTextFieldTopConstraint, phoneNumberLeadingAlignConstraint, phoneNumberTextFieldTrailingAlignConstraint, phoneNumberTextBottomViewTopConstraint, phoneNumberTextBottomViewLeadingAlignConstraint, phoneNumberTextBottomViewTrailingAlignConstraint, phoneNumberTextBottomViewHeightConstraint]
        self.view.addConstraints(textFieldConstraints)
    }
    
    func setupBottomWrapperView() {
        let bottomWrapperView = UIView()
        let bottomButton = UIButton()
        bottomWrapperView.translatesAutoresizingMaskIntoConstraints = false
        bottomWrapperView.backgroundColor = UIColor.black
        
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.setTitle("Click Me!", for: .normal)
        bottomButton.setTitleColor(UIColor.black, for: .normal)
        bottomButton.backgroundColor = UIColor.yellow
        bottomButton.addTarget(self, action: #selector(clickMeButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(bottomWrapperView)
        bottomWrapperView.addSubview(bottomButton)
        
        // MARK: - Bottom Wrapper View Constraints
        let bottomViewBottomConstraint = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .top, relatedBy: .equal, toItem: bottomWrapperView, attribute: .bottom, multiplier: 1, constant: 0)
        let bottomViewTrailingConstraint = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: bottomWrapperView, attribute: .trailing, multiplier: 1, constant: 0)
        let bottomViewLeadingConstraint = NSLayoutConstraint(item: bottomWrapperView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let bottomViewHeightConstraint = NSLayoutConstraint(item: bottomWrapperView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70)
        
        // MARK : - Bottom Button Constraints
        let bottomButtonCenterYConstraint = NSLayoutConstraint(item: bottomButton, attribute: .centerY, relatedBy: .equal, toItem: bottomWrapperView, attribute: .centerY, multiplier: 1, constant: 0)
        let bottomButtonCenterXConstraint = NSLayoutConstraint(item: bottomButton, attribute: .centerX, relatedBy: .equal, toItem: bottomWrapperView, attribute: .centerX, multiplier: 1, constant: 0)
        
        let bottomViewConstraintsArray = [bottomViewBottomConstraint,bottomViewTrailingConstraint, bottomViewLeadingConstraint,bottomViewHeightConstraint]
        self.view.addConstraints(bottomViewConstraintsArray)
        bottomWrapperView.addConstraints([bottomButtonCenterYConstraint, bottomButtonCenterXConstraint])
    }
    
    func clickMeButtonTapped() {
        let message = "Hope you liked noStoryboards app. Thanks For using it"
        let alert = UIAlertController(title: "Awesome", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
