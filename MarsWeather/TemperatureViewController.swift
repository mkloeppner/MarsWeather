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
    
    @IBOutlet var temperatureLabel : UILabel?
    
    var temperature : Temperature! {
        didSet {
            if let temperatureLabel = temperatureLabel {
                temperatureLabel.text = self.formattingService.string(fromTemperature: self.temperature.minimumTemperature)
            }
        }
    }
    
    var formattingService : FormattingService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
