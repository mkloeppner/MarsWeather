//
//  MockFormattingService.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

@testable import MarsWeather

public struct MockFormattingService : FormattingService {
    
    var returnValue :String;
    
    public func string(fromTemperature double: Double) -> String {
        return returnValue;
    }
    
}