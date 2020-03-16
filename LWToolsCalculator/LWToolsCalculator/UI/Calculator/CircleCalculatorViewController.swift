//
//  CircleCalculatorViewController.swift
//  LWToolsCalculator
//
//  Created by veimer on 3/13/20.
//  Copyright © 2020 Weimer. All rights reserved.
//

import UIKit

class CircleCalculatorViewController: CalculatorViewController {
    @IBOutlet weak var unitTextField: PickerTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapeImageView.image = CalculatorType.circle.image
        navigationItem.title = CalculatorType.circle.title
        unitTextField.items = UnitLength.allUnits
        unitTextField.selectedItem = UnitLength.millimeters
    }
}
