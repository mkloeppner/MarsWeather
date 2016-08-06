//
//  MockPlanetWeatherFetcher.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

public class MockPlanetModelFetcher : PlanetWeatherFetcher {
    
    let planetWeather : PlanetWeather
    
    public init(planetWeather: PlanetWeather) {
        self.planetWeather = planetWeather;
    }
    
    public func fetch(success: (PlanetWeather) -> Void, error: (Void) -> Void) {
        success(self.planetWeather)
    }
    
}