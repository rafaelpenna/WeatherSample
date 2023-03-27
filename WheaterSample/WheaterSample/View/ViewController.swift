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
        
    }
}

