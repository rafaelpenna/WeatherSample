//
//  ScreenVIew.swift
//  WheaterSample
//
//  Created by Rafael Penna on 24/03/23.
//

import UIKit

class ScreenView: UIView {
    
    lazy var backgroundView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background")
        image.contentMode = .center
        image.sizeToFit()
        return image
    }()
    
    lazy var conditionalImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "cloud.fog")
        image.tintColor = .black
        return image
    }()
    
    lazy var localizationImage: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(systemName: "location.circle.fill"), for: .normal)
    button.contentVerticalAlignment = .fill
    button.contentHorizontalAlignment = .fill
    button.tintColor = .black
    return button
}()
    
    lazy var searchTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Search"
        field.textAlignment = .right
        field.textColor = .white
        field.layer.borderWidth = 0.8
        field.layer.borderColor = UIColor.black.cgColor
        field.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        field.autocapitalizationType = .words
        field.returnKeyType = .go
        return field
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = .black
        return button
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "21ºC"
        label.font = UIFont.systemFont(ofSize: 70)
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Santa Maria"
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        constraintsScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        addSubview(backgroundView)
        addSubview(localizationImage)
        addSubview(searchTextField)
        addSubview(searchButton)
        addSubview(conditionalImage)
        addSubview(temperatureLabel)
        addSubview(cityLabel)
    }
    
    private func constraintsScreen(){
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            localizationImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            localizationImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            localizationImage.heightAnchor.constraint(equalToConstant: 30),
            localizationImage.widthAnchor.constraint(equalToConstant: 30),
            
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            searchTextField.leadingAnchor.constraint(equalTo: localizationImage.trailingAnchor, constant: 25),
            searchTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -25),
            searchTextField.heightAnchor.constraint(equalToConstant: 30),
            
            searchButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            searchButton.heightAnchor.constraint(equalToConstant: 30),
            searchButton.widthAnchor.constraint(equalToConstant: 30),
            
            conditionalImage.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 25),
            conditionalImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            conditionalImage.heightAnchor.constraint(equalToConstant: 80),
            conditionalImage.widthAnchor.constraint(equalToConstant: 100),
            
            temperatureLabel.topAnchor.constraint(equalTo: conditionalImage.bottomAnchor, constant: 15),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 80),
            
            cityLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
        ])
    }
}
