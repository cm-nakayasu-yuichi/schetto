//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class CalendarView: UIView {
    
    @IBInspectable var o: UIColor = .lightGray {
        didSet {
            
        }
    }
    
    override func draw(_ rect: CGRect) {
        //let context = UIGraphicsGetCurrentContext()!
        
        print(rect)
    }
}

/*
override open func draw(_ rect: CGRect) {
    let opt = self.options
    let context = UIGraphicsGetCurrentContext()
    
    opt?.backgroundColor.setFill(); UIRectFill(rect)
    
    context?.move(to: CGPoint(x: 0, y: 0))
    context?.setFillColor(self.properBackgroundColor(opt!).cgColor)
    context?.fill(rect)
    
    let minX: CGFloat = opt!.separatorLeftMargin
    let maxX: CGFloat = rect.maxX - opt!.separatorRightMargin
    let y:    CGFloat = rect.maxY - opt!.separatorWidth / 2
    context?.setStrokeColor((opt?.separatorColor.cgColor)!)
    context?.setLineWidth((opt?.separatorWidth)!)
    context?.move(to: CGPoint(x: minX, y: y))
    context?.addLine(to: CGPoint(x: maxX, y: y))
    context?.strokePath()
}
*/
