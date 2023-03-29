//
//  ViewController.swift
//  WheaterSample
//
//  Created by Rafael Penna on 24/03/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let screen: ScreenView = ScreenView()
    
    var weatherManager = WeatherManager()
    
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = screen
        screen.searchTextField.delegate = self
        weatherManager.delegate = self
        view.addSubview(searchPressed)
        view.addSubview(locationPressed)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
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
    
    lazy var locationPressed: UIButton = {
        let button: UIButton = screen.localizationImage
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isSelected = true
        button.addTarget(self, action: #selector(coordinates), for: .touchUpInside)
        return button
    }()
    
    @objc func coordinates() {
        locationManager.requestLocation()
    }
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

//MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

