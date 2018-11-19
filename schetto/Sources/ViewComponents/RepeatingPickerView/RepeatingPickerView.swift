//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol RepeatingPickerViewDelegate: class {
    
    func repeatingPickerView(_ pickerView: RepeatingPickerView, didSelectRow row: Int, inComponent component: Int)
}

class RepeatingPickerView : UIPickerView {
    
    weak var repeatingDelegate: RepeatingPickerViewDelegate?
    
    private let max = 10000
    
    private var rowsInComponents = [[String]]()
    private var indecies = [Int]()
    
    func set(rowsInComponents: [[String]], indecies: [Int]) {
        self.rowsInComponents = rowsInComponents
        self.indecies = indecies
        self.delegate = self
        self.dataSource = self
        moveToCenterAll()
    }
    
    func moveToCenter(row: Int, forComponent component: Int) {
        let rowIndex = (max / 2) - ((max / 2) % rowsInComponents[component].count) + row
        selectRow(rowIndex, inComponent: component, animated: false)
        repeatingDelegate?.repeatingPickerView(self, didSelectRow: row, inComponent: component)
    }
    
    private func moveToCenterAll() {
        rowsInComponents.enumerated().forEach { component, rows in
            let rowIndex = defaultIndex(forComponent: component, rows: rows)
            moveToCenter(row: rowIndex, forComponent: component)
        }
    }
    
    private func defaultIndex(forComponent component: Int, rows: [String]) -> Int {
        if (indecies.count - 1) > component || indecies[component] > (rows.count - 1) {
            return 0
        }
        return indecies[component]
    }
}

extension RepeatingPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return rowsInComponents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return max
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let remain = row % rowsInComponents[component].count
        return "\(rowsInComponents[component][remain])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        moveToCenter(row: row % rowsInComponents[component].count, forComponent: component)
    }
}
