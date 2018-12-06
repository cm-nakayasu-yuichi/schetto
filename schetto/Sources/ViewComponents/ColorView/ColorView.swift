//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

@IBDesignable class ColorView: UIView {
    
    @IBInspectable var color: UIColor = UIColor.blue.withAlphaComponent(0.8) {
        didSet {
            layoutIfNeeded()
        }
    }
    
    override func draw(_ rect: CGRect) {
        drawLeftTopTriangle(rect, color: .white)
        drawRightBittomTriangle(rect, color: .black)
        drawLeftTopTriangle(rect, color: color)
        drawRightBittomTriangle(rect, color: color)
    }
    
    private func drawLeftTopTriangle(_ rect: CGRect, color: UIColor) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(rect.maxX, rect.minY))
        path.addLine(to: CGPoint(rect.minX, rect.minY))
        path.addLine(to: CGPoint(rect.minX, rect.maxY))
        path.close()
        
        color.setFill()
        path.fill()
    }
    
    private func drawRightBittomTriangle(_ rect: CGRect, color: UIColor) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(rect.maxX, rect.minY))
        path.addLine(to: CGPoint(rect.minX, rect.maxY))
        path.addLine(to: CGPoint(rect.maxX, rect.maxY))
        path.close()
        
        color.setFill()
        path.fill()
    }
}
