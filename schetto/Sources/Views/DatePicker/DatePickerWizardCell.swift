//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol DatePickerWizardCellDelegete: class {
    
}

class DatePickerWizardCell: UITableViewCell {
    
    weak var delegate: DatePickerWizardCellDelegete!
}
