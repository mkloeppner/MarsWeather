//
//  MarsWeather.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

// http://marsweather.ingenology.com/v1/latest/?format=json

public struct MarsWeather {
    
    var terrestrialDate : NSDate?
    var sol : Int
    var ls : Double
    var minTemp : Double
    var minTempFahrenheit : Double
    var maxTemp : Double
    var maxTempFahrenheit : Double
    var pressure : Double
    var pressureString : String
    var absHumidity : String?
    var windSpeed : Int?
    var windDirection : String?
    var atmoOpacity : String?
    var season : String?
    var sunrise : NSDate?
    var sunset : NSDate?
    
}