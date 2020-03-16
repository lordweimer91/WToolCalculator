//
//  PickerTextField.swift
//  LWToolsCalculator
//
//  Created by veimer on 3/13/20.
//  Copyright © 2020 Weimer. All rights reserved.
//

import UIKit

protocol PickerTextFieldItem {
    var title: String {get}
    func isEqualTo(_ other: PickerTextFieldItem) -> Bool
}

class PickerTextField: UITextField {

    private var picker: UIPickerView! {
        return inputView as? UIPickerView
    }
    
    var selectedItem: PickerTextFieldItem?
    
    var items = [PickerTextFieldItem]() {
        didSet {
            picker.reloadAllComponents()
            if let selected = selectedItem,
                let row = items.firstIndex(where: { $0.isEqualTo(selected) }) {
                picker.selectRow(row, inComponent: 0, animated: false)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        picker.showsSelectionIndicator = true
        
        inputView = picker
    }
}

extension PickerTextField: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row].title
    }
}

extension PickerTextField: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedItem = items[row]
        text = selectedItem?.title
        actions(forTarget: self, forControlEvent: .editingChanged)
        resignFirstResponder()
    }
}
