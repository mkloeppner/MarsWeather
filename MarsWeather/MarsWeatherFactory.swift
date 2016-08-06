//
//  MarsWeatherFactory.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

public class MarsWeatherFactory {
    
    var formattingService : FormattingService!;
    
    public func create(dictionary: NSDictionary) -> MarsWeather? {
        guard let report = dictionary.valueForKey("report") else {
            return nil;
        }
        
        let marsWeather : MarsWeather = MarsWeather(
            terrestrialDate: self.formattingService.date(from: report.valueForKey("terrestrial_date")! as! String),
            sol: report.valueForKey("sol") as! Int,
            ls: report.valueForKey("ls") as! Double,
            minTemp: report.valueForKey("sol") as! Double,
            minTempFahrenheit: report.valueForKey("min_temp_fahrenheit") as! Double,
            maxTemp: report.valueForKey("max_temp") as! Double,
            maxTempFahrenheit: report.valueForKey("max_temp_fahrenheit") as! Double,
            pressure: report.valueForKey("pressure") as! Double,
            pressureString: report.valueForKey("pressure_string") as! String,
            absHumidity: report.valueForKey("absHumidity") as! String?,
            windSpeed: nil,
            windDirection: report.valueForKey("wind_direction") as! String,
            atmoOpacity: nil,
            season: report.valueForKey("season") as! String,
            sunrise: self.formattingService.date(from: report.valueForKey("sunrise") as! String),
            sunset: self.formattingService.date(from: report.valueForKey("sunset") as! String)
        )
        return marsWeather
    }
    
}