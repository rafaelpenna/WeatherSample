//
//  ViewController.swift
//  WheaterSample
//
//  Created by Rafael Penna on 24/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    let screen: ScreenView = ScreenView()
    
    var weatherManager = WeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = screen
        screen.searchTextField.delegate = self
        weatherManager.delegate = self
        view.addSubview(searchPressed)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    lazy var searchPressed: UIButton = {
        let button: UIButton = screen.searchButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isSelected = true
        button.addTarget(self, action: #selector(cityToSearch), for: .touchUpInside)
        return button
    }()
}

//MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    @objc func cityToSearch() {
        screen.searchTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = screen.searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        screen.searchTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        screen.searchTextField.endEditing(true)
        becomeFirstResponder()
        return true
    }
}

//MARK: - WeatherManagerDelegate

extension ViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.screen.temperatureLabel.text = "\(weather.temperatureString)ºC"
            self.screen.conditionalImage.image = UIImage(systemName: weather.conditionName)
            self.screen.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

