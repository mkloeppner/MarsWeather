//
//  NetworkService+MarsWeatherApiNetworkServiceAdapter.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

/**
 * The extensions decouple the MarsWeatherApi from the rest of this application such as the NetworkService.
 *
 * Due to this, MarsWeatherApi can be extracted and used in an other app, once that app provides a extension to make its network apis conforming to the MarsWeatherApiNetworking protocol.
 */
extension NetworkingService : MarsWeatherApiNetworking {
    
    
}