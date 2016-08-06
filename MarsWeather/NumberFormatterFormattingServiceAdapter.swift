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
    let dateFormatter : NSDateFormatter
    
    public init() {
        self.decimalNumberFormatter = NSNumberFormatter()
        self.decimalNumberFormatter.numberStyle = .DecimalStyle
        
        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateStyle = .FullStyle
        self.dateFormatter.timeStyle = .NoStyle
    }
    
    public func string(fromTemperature double: Double) -> String {
        return self.decimalNumberFormatter.stringFromNumber(NSNumber(double: double))!
    }
    
    public func date(from value: String) -> NSDate? {
        return self.dateFormatter.dateFromString(value)
    }
    
}