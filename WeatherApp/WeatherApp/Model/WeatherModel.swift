//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Aaron Cabreja on 1/22/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct Weather: Codable {
    let response: [Response]
}
struct Response: Codable {
    let periods: [Periods]
}
struct Periods: Codable {
    let timestamp: Int
    let dateTimeISO: String
    let maxTempF: Int
    let minTempF: Int
    let avgTempF: Int
    let humidity: Int
    let avgFeelslikeF: Int
    let windDir: String
    let windSpeedMPH: Int
    let weather: String
    let icon: String
    let sunrise: Int
    let sunset: Int
    public var dateFormattedString: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = dateTimeISO
        if let date = isoDateFormatter.date(from: dateTimeISO) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    public var date: Date {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoDateFormatter.date(from: dateTimeISO) {
            formattedDate = date
        }
        return formattedDate
    }
}


