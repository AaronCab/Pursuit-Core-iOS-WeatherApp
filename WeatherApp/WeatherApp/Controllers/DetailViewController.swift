//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Aaron Cabreja on 1/22/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var weatherResult:  Periods!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var perciptiationLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    func updateUI(){
        highLabel.text = "High: \(weatherResult.maxTempF)"
        lowLabel.text = "Low: \(weatherResult.minTempF)"
        sunriseLabel.text = "Sunrise: \(weatherResult.dateFormattedString3)"
        sunsetLabel.text = "Sunset: \(weatherResult.dateFormattedString2)"
        windSpeedLabel.text = "Wind Speed: \(weatherResult.windSpeedMPH) MPH"
        dateLabel.text = weatherResult.dateFormattedString
        perciptiationLabel.text =  "Precipitation: \(weatherResult.precipIN) inches"
    }

}
