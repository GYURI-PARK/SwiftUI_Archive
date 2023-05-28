//
//  Models.swift
//  MVVM
//
//  Created by GYURI PARK on 2023/05/28.
//

import Foundation

// Data

struct WeatherModel: Codable {
    let timezone: String
    let current: CurrentWeather
}

struct CurrentWeather: Codable {
    let temp: Float
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable {
    let main: String
    let description: String
}
