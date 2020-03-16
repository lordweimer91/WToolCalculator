//
//  Unit+Utils.swift
//  LWToolsCalculator
//
//  Created by veimer on 3/13/20.
//  Copyright © 2020 Weimer. All rights reserved.
//

import Foundation

extension Unit: PickerTextFieldItem {
    static let formatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .short
        return formatter
    }()
    
    var title: String {
        return UnitLength.formatter.string(from: self)
    }
    
    func isEqualTo(_ other: PickerTextFieldItem) -> Bool {
        guard let other = other as? Unit else {
            return false
        }
        return self.symbol == other.symbol
    }
}

extension UnitLength {
    static var allUnits: [UnitLength] {
        return [
            .millimeters,
            .centimeters,
            .decimeters,
            .kilometers,
            .inches,
            .feet,
            .miles
        ]
    }
}
