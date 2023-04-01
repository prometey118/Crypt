//
//  ViewController.swift
//  cryptGraph
//
//  Created by Yaroslav Savin on 16.03.2023.
//

import UIKit

class ViewController: UIViewController {
    var textLabel = UILabel()
    var stackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = "Тестовое здание"
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 16
        stackView.addArrangedSubview(textLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}

