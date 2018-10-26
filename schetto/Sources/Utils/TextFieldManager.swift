//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TextFieldManagerDelegate: class {
    
    func textFieldManager(_ textFieldManager: TextFieldManager, changed text: String)
    
    func textFieldManager(_ textFieldManager: TextFieldManager, commit text: String)
    
    func textFieldManager(_ textFieldManager: TextFieldManager, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
}
extension TextFieldManagerDelegate {
    
    func textFieldManager(_ textFieldManager: TextFieldManager, changed text: String) {}
    func textFieldManager(_ textFieldManager: TextFieldManager, commit text: String) {}
    func textFieldManager(_ textFieldManager: TextFieldManager, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { return true }
}

class TextFieldManager: NSObject, UITextFieldDelegate {
    
    /// 管理するテキストフィールド
    private(set) weak var textField: UITextField!
    
    /// デリゲート
    weak var delegate: TextFieldManagerDelegate?
    
    /// リターンキー押下で値を確定させるかどうか
    var shouldCommitReturnKey = true
    
    /// 許可する文字列長
    var maxLength: Int? = nil
    
    /// テキストフィールドの文字値(非オプショナル)
    var text: String {
        get {
            return textField.text ?? ""
        }
        set {
            textField.text = newValue
        }
    }
    
    private var previous = ""
    
    /// テキストフィールドの参照を渡して初期化
    /// - Parameter textField: テキストフィールドの参照
    init(_ textField: UITextField) {
        self.textField = textField
        super.init()
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        previous = text
    }
    
    /// キーボードを閉じてテキストフィールドの値を確定させる
    func commit() {
        if textField.isFirstResponder {
            textField.resignFirstResponder()
        } else {
            textFieldDidEndEditing(textField)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if shouldCommitReturnKey {
            commit()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let max = maxLength, text.count > max {
            text = String(text.prefix(max))
        }
        
        delegate?.textFieldManager(self, commit: text)
        textField.text = text
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.textFieldManager(self, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
    @objc func textFieldDidEditingChanged(_ textField: UITextField) {
        if previous == text { return }
        previous = text
        
        delegate?.textFieldManager(self, changed: text)
    }
}
