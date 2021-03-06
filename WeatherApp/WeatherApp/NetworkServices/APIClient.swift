//
//  APIClient.swift
//  WeatherApp
//
//  Created by Aaron Cabreja on 1/22/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class APIClient {
    
    static func getWeather(zipCode: String, completionHandler: @escaping (AppError?, [Periods]?) -> Void) {
        let urlString = "https://api.aerisapi.com/forecasts/\(zipCode)?client_id=\(SecretyKeys.AccessID)&client_secret=\(SecretyKeys.APIKey)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data, response) in
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                do {
                    let weatherData = try JSONDecoder().decode(Weather.self, from: data)
                    completionHandler(nil, weatherData.response.first?.periods)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
    static func getLocation(location: String, completionHandler: @escaping (AppError?, Hits?) -> Void) {
        let urlString = "https://pixabay.com/api/?key=\(SecretyKeys.pixabayKey)&q=\(location)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data, response) in
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                dump(data)
                do {
                    let weatherData = try JSONDecoder().decode(Picture.self, from: data).hits.randomElement()
                    completionHandler(nil, weatherData)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
}
