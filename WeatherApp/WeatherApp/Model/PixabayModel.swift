//
//  PixabayModel.swift
//  WeatherApp
//
//  Created by Aaron Cabreja on 1/22/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Picture: Codable {
    let hits: [Hits]
}
struct Hits: Codable{
    let largeImageURL: String
}
