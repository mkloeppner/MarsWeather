//
//  PlanetWeatherFetcher.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

public protocol PlanetWeatherFetcher {
    
    func fetch(success:(PlanetWeather) -> Void, error: (Void)->Void)
    
}