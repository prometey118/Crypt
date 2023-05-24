//
//  SheetController.swift
//  CryptGr
//
//  Created by Yaroslav Savin on 02.04.2023.
//

import UIKit
struct CustomData {
    var title: String
}

class SheetController: UIViewController, UISheetPresentationControllerDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data1[indexPath.item]
        return cell
    }
    fileprivate let data1 = [
        CustomData(title: "The Islands!"),
        CustomData(title: "Subscribe to maxcodes boiiii!"),
        CustomData(title: "StoreKit Course!"),
        CustomData(title: "Collection Views!"),
        CustomData(title: "MapKit!"),
    ]
    
    fileprivate let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    var datePicker = UIDatePicker()
    var stackView = UIStackView()
    
    override var sheetPresentationController: UISheetPresentationController{
        presentationController as! UISheetPresentationController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .orange
        
        sheetPresentationController.delegate = self
        sheetPresentationController.selectedDetentIdentifier = .medium
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [.medium(),]
        
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        datePicker.locale = .current
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = .systemBlue
        
        
        stackView.addArrangedSubview(datePicker)
//        stackView.addArrangedSubview(collectionView)
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: -40).isActive = true
//        stackView.leftAnchor.
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
//        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        
    }
    
}

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.text = data.title
            print("awcasca")
            
        }
    }
    
    fileprivate let bg: UITextView = {
       let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        


        
        contentView.addSubview(bg)

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
