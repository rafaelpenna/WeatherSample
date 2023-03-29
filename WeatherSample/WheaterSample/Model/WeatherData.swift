//
//  WeatherData.swift
//  WheaterSample
//
//  Created by Rafael Penna on 28/03/23.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}

