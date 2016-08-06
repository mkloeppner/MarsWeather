//
//  MarsWeatherApiNetworking.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

public protocol MarsWeatherApiNetworking {
    
    /**
     * @var url The service url 
     * @query HTTP Query Parameters
     */
    func get(url: NSURL, query: Dictionary<String, String>, success: (AnyObject) -> Void)
    
}