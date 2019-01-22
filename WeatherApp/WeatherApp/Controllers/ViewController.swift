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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherCollectionView.dataSource = self
        weatherCollectionView.delegate = self
        APIClient.getWeather(zipCode: "11377"){(error, results) in
            if let error = error {
                print(error.errorMessage())
            } else if let results = results {
                DispatchQueue.main.async {
                    self.result = results
                    dump(results)
                }
                
            }
        }
        
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


extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize.init(width: 100, height: 100)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc =
//            storyBoard.instantiateViewController(withIdentifier: "MagicCards") as! MagicDetailViewController
//
//        vc.modalPresentationStyle = .overCurrentContext
//
//        let magicCards = cards[indexPath.row]
//        vc.magic = magicCards
//        //shows you the viewcontroller
//        present(vc, animated: true, completion: nil)
//    }
    
}
