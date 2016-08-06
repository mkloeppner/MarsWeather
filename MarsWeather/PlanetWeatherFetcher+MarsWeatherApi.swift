//
//  PlanetWeatherFetcher+MarsWeatherApi.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

extension MarsWeatherApi : PlanetWeatherFetcher {
    public func fetch(success: (PlanetWeather) -> Void, error: (Void) -> Void) {
        self.fetchMarsWeather({ marsWeather in
            success(marsWeather)
        }) {
            error()
        }
    }
}
