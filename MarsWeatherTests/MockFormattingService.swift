//
//  MockFormattingService.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation
@testable import MarsWeather

public struct MockFormattingService : FormattingService {
    
    var returnValue :String;
    
    var dateReturnValue : NSDate? = nil
    
    public init(returnValue: String, dateReturnValue :NSDate? = nil) {
        self.returnValue = returnValue
        self.dateReturnValue = dateReturnValue
    }
    
    public func string(fromTemperature double: Double) -> String {
        return returnValue
    }
    
    public func date(from value: String) -> NSDate? {
        return dateReturnValue
    }
    
}