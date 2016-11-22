//
//  RCShapeFactory.swift
//  TestRCShapeCreator
//
//  Created by Ryan Cocuzzo on 11/21/16.
//  Copyright © 2016 rcocuzzo8. All rights reserved.
//

import UIKit

class RCShapeFactory: UIView {
    
    
    var myShape: RCShape!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        myShape = RCShape()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        print("drawing✅")
        UIColor.orange.setFill()
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.orange.cgColor)
        context?.fill(rect)
        
        print("XXXX")
        UIColor.blue.setStroke()
        
        let path = UIBezierPath()
        path.fill()
        
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
            //   path.move(to: firstPoint)
            
            path.stroke()
        }
        
        
        
        
    }
    
    
    
}
