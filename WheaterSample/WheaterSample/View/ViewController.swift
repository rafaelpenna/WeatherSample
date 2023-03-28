//
//  ViewController.swift
//  WheaterSample
//
//  Created by Rafael Penna on 24/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    let screen: ScreenView = ScreenView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = screen
        screen.searchTextField.delegate = self
        view.addSubview(searchPressed)
        
    }
    
    lazy var searchPressed: UIButton = {
        let button: UIButton = screen.searchButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isSelected = true
        button.addTarget(self, action: #selector(cityToSearch), for: .touchUpInside)
        return button
    }()
    
    @objc func cityToSearch() {
        screen.searchTextField.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(screen.searchTextField.text!)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen.searchTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        screen.searchTextField.endEditing(true)
        becomeFirstResponder()
        return true
    }
}

