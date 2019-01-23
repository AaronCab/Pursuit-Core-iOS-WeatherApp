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
    let sunriseISO: String
    let sunsetISO: String
    let precipIN: Double
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
    public var dateFormattedString2: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = sunsetISO
        if let date = isoDateFormatter.date(from: formattedDate) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm a"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    public var date2: Date {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoDateFormatter.date(from: sunsetISO) {
            formattedDate = date
        }
        return formattedDate
    }
    public var dateFormattedString3: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = sunriseISO
        if let date = isoDateFormatter.date(from: formattedDate) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm a"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    public var date3: Date {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoDateFormatter.date(from: sunriseISO) {
            formattedDate = date
        }
        return formattedDate
    }
}


