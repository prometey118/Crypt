//
//  ViewController.swift
//  cryptGraph
//
//  Created by Yaroslav Savin on 16.03.2023.
//

import UIKit

class ViewController: UIViewController, UISheetPresentationControllerDelegate {
    var textLabel = UILabel()
    var datePicker = UIDatePicker()
    var stackView = UIStackView()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle(" Указать дату ", for: .normal)
        button.layer.cornerRadius = 9
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = "Тестовое здание"
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 16
        
        self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        datePicker.locale = .current
//        datePicker.datePickerMode = .dateAndTime
//        datePicker.preferredDatePickerStyle = .compact
//        datePicker.tintColor = .systemBlue
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackView.addArrangedSubview(textLabel)
//        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(button)
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
    }
    @objc func didTapButton() {
        let vc = SheetController()
        self.present(vc, animated: true, completion: nil)
    }
}

