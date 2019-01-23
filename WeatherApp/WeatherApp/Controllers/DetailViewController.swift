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
    var pixabayResul: Hits!

    var location: String!
    @IBOutlet weak var pixabayImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
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
    }
    
  
    func getaTheURL(string:String){
        APIClient.getLocation(location: string.replacingOccurrences(of: " ", with: "%20")) { (error, url) in
            if let error = error{
                print(error.errorMessage())
            }
            if let url = url{
                self.pixabayResul = url
                let url = url
                self.getImages(newString: url.largeImageURL)
            }
        }
    }

    func getImages(newString:String){
        ImageHelper.shared.fetchImage(urlString: newString) { (error, image) in
            if let error = error {
                print(error.errorMessage())
            }
            if let image = image {
                self.pixabayImage.image = image
            }
        }
    }
    func updateUI(){
        highLabel.text = "High: \(weatherResult.maxTempF)"
        lowLabel.text = "Low: \(weatherResult.minTempF)"
        sunriseLabel.text = "Sunrise: \(weatherResult.dateFormattedString3)"
        sunsetLabel.text = "Sunset: \(weatherResult.dateFormattedString2)"
        windSpeedLabel.text = "Wind Speed: \(weatherResult.windSpeedMPH) MPH"
        dateLabel.text = weatherResult.dateFormattedString
        perciptiationLabel.text =  "Precipitation: \(weatherResult.precipIN) inches"
        weatherLabel.text = weatherResult.weather
        guard let location = location else {return}
        getaTheURL(string: location)
        


        

}
    
//    @IBAction func saveButton(_ sender: UIButton) {
//    }


}
