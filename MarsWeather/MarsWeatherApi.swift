//
//  MarsWeatherApi.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

public class MarsWeatherApi {
    
    let baseURLPath = "http://marsweather.ingenology.com"
    let resourceURI = "/v1/latest/"
    
    var networking : MarsWeatherApiNetworking!
    var modelTypeFactory : MarsWeatherFactory!
    
    public func fetchMarsWeather(success: (MarsWeather) -> Void, error: (Void) -> Void) {
        self.networking.get(NSURL(string: baseURLPath + resourceURI)!, query: ["format" : "json"], success: { values in
                guard let values = values as? NSDictionary else {
                    return
                }
            
                if let weather = self.modelTypeFactory.create(values) {
                    success(weather)
                }
            }, error:
            {
                error()
            }
        )
    }
    
}