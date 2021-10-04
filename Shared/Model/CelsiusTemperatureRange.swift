//
//  CelsiusTemperatureRange.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation

struct CelsiusTemperatureRange {
    
    // Description of the feel of this temperature range
    let feel: String
    
    // The lower and upper boundaries of a temperature within this range
    let bounds: ClosedRange<Double>
    
}
