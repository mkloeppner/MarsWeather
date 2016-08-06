//
//  PlanetWeatherAdapter.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

extension MarsWeather : PlanetWeather {
    
    public var temperature: Temperature {
        get {
            return Temperature(min: self.minTemp, max: self.maxTemp)
        }
    }
    
}