//
//  FormattingService.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

public protocol FormattingService {
    
    func string(fromTemperature double:Double) -> String;
    
    func date(from value: String) -> NSDate?;
    
}