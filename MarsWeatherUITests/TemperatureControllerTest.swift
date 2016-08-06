//
//  TemperatureControllerTest.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import XCTest
@testable import MarsWeather

class TemperatureControllerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIfTemperatureViewControllerUpdatesTemperatureLabelIfTemperatureIsSet() {
        
        let expected = "10 °C";
        
        let tempController = TemperatureViewController()
        tempController.temperatureLabel = MockUILabel()
        tempController.formattingService = MockFormattingService(returnValue: expected)
        tempController.temperature = MockTemperature(minimumTemperature: 1.5, maximumTemperature: 2.0)
        
        XCTAssertEqual(expected, tempController.temperatureLabel?.text)
    }
    
}
