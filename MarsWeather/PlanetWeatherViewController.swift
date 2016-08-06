//
//  ViewController.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import UIKit

class PlanetWeatherViewController: UIViewController {

    var planetWeather : PlanetWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let identifier = segue.identifier else {
            return;
        }
        
        switch identifier {
        case "TemperatureDetails":
            guard let sender = sender as? TemperatureViewController else {
                break;
            }
            sender.temperature = self.planetWeather.temperature
            
        default: break
            
        }
    }

}

