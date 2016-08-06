//
//  ViewController.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import UIKit

class PlanetWeatherViewController: UIViewController {
    
    var planetWeather : PlanetWeather? {
        didSet {
            self.updateChildViewController()
        }
    }
    
    var selectedDetailViewController : UIViewController! {
        didSet {
            self.updateChildViewController()
        }
    }
    
    var planetWeatherFetcher : PlanetWeatherFetcher!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.planetWeatherFetcher.fetch(
            { planetWeather in self.planetWeather = planetWeather }
            , error: { error in
            // TODO:
        })
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.selectedDetailViewController = segue.destinationViewController
    }
    
    func updateChildViewController() {
        switch selectedDetailViewController {
        case let selectedDetailViewController as TemperatureViewController:
            if let temperature = self.planetWeather?.temperature {
                selectedDetailViewController.temperature = temperature
            }
            
        default: break
        }
    }
    
    @IBAction
    func onReloadButtonPressed(sender: AnyObject) {
        self.planetWeatherFetcher.fetch({ (planetWeather) in
            self.planetWeather = planetWeather
            }, error: { _ in
            // TODO:
        })
    }

}


