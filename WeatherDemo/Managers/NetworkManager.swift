//
//  WeatherManager.swift
//  WeatherDemo
//
//  Created by Tomasz Piątek on 12/01/2023.
//

import Foundation

struct NetworkManager {
    
    let urlFirst = "https://api.openweathermap.org/data/2.5/weather?appid=b9837475c8dfb3956e7fc51ec1dd92e2&units=metric"
    
    func cityName(cityName: String) {
        let urlString = "\(urlFirst)&q=\(cityName)"
        request(urlString: urlString)
    }
    
    func request(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, responde, error in
                
                if error != nil {
                    print("Error: \(error!)")
                    return
                }
                
                if let safeData = data {
                    //let dataString = String(data: safeData, encoding: .utf8)
                    parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherModel.self, from: weatherData)
            print("City: \(decodedData.name), data: \(decodedData.main.temp)")
            print("Weather description: \(decodedData.weather[0].description)")
        } catch {
            print("Error parseJSON: \(error)")
        }
    }
    
    
}

