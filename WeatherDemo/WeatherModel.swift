//
//  WeatherModel.swift
//  WeatherDemo
//
//  Created by Tomasz Piątek on 12/01/2023.
//

import Foundation

struct WeatherModel: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]

}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    
}
