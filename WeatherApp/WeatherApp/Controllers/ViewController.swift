//
//  ViewController.swift
//  WeatherApp
//
//  Created by Alex Paul on 1/17/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var result = [Periods](){
        didSet {
            DispatchQueue.main.async {
                self.weatherCollectionView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    @IBOutlet weak var zipTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherCollectionView.dataSource = self
        weatherCollectionView.delegate = self
        zipTextField.delegate = self
        
    }
    
}
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? weatherCollectionViewCell else { return UICollectionViewCell()}
        let weatherToSet = result[indexPath.row]
        
        
        cell.dateLabel.text = weatherToSet.dateFormattedString
        cell.highLabel.text = "High: \(weatherToSet.maxTempF)"
        cell.lowLabel.text = "Low: \(weatherToSet.minTempF)"
        cell.weatherImage.image = UIImage(named: weatherToSet.icon)

        return cell
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textfieldText = zipTextField.text
        APIClient.getWeather(zipCode: textfieldText!){(error, results) in
            if let error = error {
                print(error.errorMessage())
            } else if let results = results {
                DispatchQueue.main.async {
                    self.result = results
                   
                }
                
            }
        }
        return true
    }
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc =
            storyBoard.instantiateViewController(withIdentifier: "WeatherDetailID") as! DetailViewController

        vc.modalPresentationStyle = .overCurrentContext

        let weather = result[indexPath.row]
        vc.weatherResult = weather
        //shows you the viewcontroller
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
