//
//  TemperatureViewController.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

import UIKit

class TemperatureViewController: UIViewController {
    
    @IBOutlet var minTemperatureLabel : UILabel?
    @IBOutlet var maxTemperatureLabel : UILabel?
    
    var temperature : Temperature! {
        didSet {
            if let minTemperatureLabel = minTemperatureLabel {
                minTemperatureLabel.text = self.formattingService.string(fromTemperature: self.temperature.min)
            }
            if let maxTemperatureLabel = maxTemperatureLabel {
                maxTemperatureLabel.text = self.formattingService.string(fromTemperature: self.temperature.max)
            }
        }
    }
    
    var formattingService : FormattingService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.masksToBounds = true
        self.view.layer.cornerRadius = 5.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
