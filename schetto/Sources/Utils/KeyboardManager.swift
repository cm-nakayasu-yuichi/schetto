//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol KeyboardManagerDelegate: class {
    
    func keyboardManager(_ keyboardManager: KeyboardManager, willChange frame: CGRect)
    
    func keyboardManager(_ keyboardManager: KeyboardManager, didChange frame: CGRect)
}

class KeyboardManager {
    
    weak var delegate: KeyboardManagerDelegate?
    
    private var height = CGFloat.nan
    private var y = CGFloat.nan
    private(set) var beginFrame = CGRect.zero
    private(set) var endFrame = CGRect.zero
    
    init() {
        observeKeyboardEvents()
    }
    
    private var notificationNames: [Notification.Name] {
        return [
            .UIKeyboardWillShow,
            .UIKeyboardWillChangeFrame,
            .UIKeyboardWillHide,
        ]
    }
    
    private func observeKeyboardEvents() {
        notificationNames.forEach { name in
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(willChangeKeyboardFrame(_:)),
                name: name,
                object: nil
            )
        }
    }
    
    @objc func willChangeKeyboardFrame(_ notify: Notification) {
        guard
            let userInfo = notify.userInfo,
            let begin = userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect,
            let end = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
            let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt,
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval
            else {
                return
        }
        
        beginFrame = begin
        endFrame = end
        
        // 初回のみ
        if height.isNaN && y.isNaN {
            height = beginFrame.height
            y = beginFrame.minY
        }
        
        // 別画面でキーボードを表示すると変数yに大きな整数が入ってしまうため
        if endFrame.minY > UIScreen.main.bounds.height * 2 {
            return
        }
        // 高さもY座標も変化していない場合は処理抜け
        if height == endFrame.height && y == endFrame.minY {
            return
        }
        
        height = endFrame.height
        y = endFrame.minY
        
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: UIView.AnimationOptions(rawValue: curve),
            animations: {
                self.delegate?.keyboardManager(self, willChange: self.endFrame)
        },
            completion: { _ in
                self.delegate?.keyboardManager(self, didChange: self.endFrame)
        }
        )
    }
    
    var distanceFromScreenBottom: CGFloat {
        var distance = UIScreen.main.bounds.height - endFrame.minY
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.keyWindow {
                distance -= window.safeAreaInsets.bottom
            }
        }
        if distance < 0 {
            distance = 0
        }
        return distance
    }
}
