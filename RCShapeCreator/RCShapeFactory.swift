//
//  RCShapeFactory.swift
//  TestRCShapeCreator
//
//  Created by Ryan Cocuzzo on 11/21/16.
//  Copyright © 2016 rcocuzzo8. All rights reserved.
//

import UIKit
import QuartzCore

class RCShapeFactory: UIView {
    
    
    var myShape: RCShape!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        myShape = RCShape()
        lineColor = UIColor.darkBluee
        viewBackgroundColor = UIColor.lightBluee
    }
    
    var lineWidth = 1
    
    var lineColor: UIColor!
    
    var viewBackgroundColor: UIColor!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        UIColor.yellow.setFill()
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(viewBackgroundColor.cgColor)
        context?.fill(rect)
        
        lineColor.setStroke()
        
        let path = UIBezierPath()
        path.fill()
        path.lineWidth = CGFloat(lineWidth)
        
        if myShape.pointsCount > 0{
            path.move(to: myShape.points[0])
            if myShape.pointsCount > 0 {
                for point in myShape.points {
                    if point != path.currentPoint {
                        path.addLine(to: point)
                        path.stroke()
                        path.move(to: point)
                    }
                }
            }
            let firstPoint = myShape.points[0]
            path.addLine(to: firstPoint)
            
            
            path.stroke()
            
            
        }
    }
    
    
}
extension UIColor{
    
    class var lightBluee: UIColor {
        return UIColor(red: 173/255, green: 229/255, blue: 247/255, alpha: 1)
    }
    
    class var darkBluee: UIColor {
        return UIColor(red: 35/255, green: 121/255, blue: 150/255, alpha: 1)
    }
}
