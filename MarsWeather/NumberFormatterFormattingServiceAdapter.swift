//
//  NSNumberFormatter+FormattingService.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

public class NumberFormatterFormattingServiceAdapter : FormattingService {
    
    let decimalNumberFormatter : NSNumberFormatter
    
    public init() {
        self.decimalNumberFormatter = NSNumberFormatter()
        self.decimalNumberFormatter.numberStyle = .DecimalStyle
    }
    
    public func string(fromTemperature double: Double) -> String {
        return self.decimalNumberFormatter.stringFromNumber(NSNumber(double: double))!
    }
    
}