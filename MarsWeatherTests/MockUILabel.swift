//
//  MockUILabel.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import UIKit

public class MockUILabel : UILabel {
    
    var textCalledCounter : Int = 0;
    
    public override var text: String? {
        didSet {
            self.textCalledCounter = self.textCalledCounter + 1;
        }
    }
    
}