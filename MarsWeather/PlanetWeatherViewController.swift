//
//  ViewController.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import UIKit

class PlanetWeatherViewController: UIViewController {
    
    let toastDuration = 1;
    
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
        self.planetWeatherFetcher.fetch({ (planetWeather) in
            self.planetWeather = planetWeather
            self.notify("Updated");
            }, error: { _ in
                self.notify("Failed fetching weather data.");
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
                self.notify("Updated");
            }, error: { _ in
                self.notify("Failed fetching weather data.");
        })
    }
    
    func notify(message: String) {
        let updatedDialog = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
        self.presentViewController(updatedDialog, animated: true, completion: nil)
    
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(UInt64(self.toastDuration) * NSEC_PER_SEC)), dispatch_get_main_queue(), {
            updatedDialog.dismissViewControllerAnimated(true, completion: { 
                
            })
            
            })


    }


}


