//
//  RCShape.swift
//  RCShapeCreator
//
//  Created by Ryan Cocuzzo on 11/21/16.
//  Copyright © 2016 rcocuzzo8. All rights reserved.
//

import Foundation
import UIKit
class RCShape {
    
    var pointsCount: Int!
    
    var points = [CGPoint]()
    
    init(_origin: Float) {
        origin = _origin
        pointsCount = 0
    }
    
    init(){
        pointsCount = 0
    }
    
    func addPoint(point: CGPoint){
        
        points.append(point)
        pointsCount = pointsCount + 1
        points.sort {
            if $0.0.x != $0.1.x {
                return $0.0.x > $0.1.x
            } else {
                return $0.0.y < $0.1.y
            }
        }
        
    }
    
    var origin: Float {
        get {
            if origin != nil {
                return origin
            } else {
                return 0
            }
        }
        
        set {
            /* NOT USING
             // Set origin
             // Set maxX to origin + (width/2)
             // set maxY to origin + (length/2)
             // Set minX to origin - (width/2)
             // set minY to origin - (length/2)
             */
            origin = newValue
        }
    }
    
    var minX: Float {
        get {
            if minX != nil {
                return minX
            } else {
                return 0
            }
        }
        
        set {
            minX  = newValue
        }
    }
    
    var maxX: Float {
        get {
            if maxX != nil {
                return maxX
            } else {
                return 0
            }
        }
        
        set {
            maxX  = newValue
        }
    }
    
    var minY: Float {
        get {
            if minY != nil {
                return minY
            } else {
                return 0
            }
        }
        
        set {
            minY = newValue
        }
    }
    
    var maxY: Float {
        get {
            if maxY != nil {
                return maxY
            } else {
                return 0
            }
        }
        
        set {
            maxY = newValue
        }
    }
    
    var length: Float {
        get {
            if length != nil {
                return length
            } else {
                return 0
            }
        }
        
        set {
            length = newValue
        }
    }
    
    var width: Float {
        get {
            if width != nil {
                return width
            } else {
                return 0
            }
        }
        
        set {
            width = newValue
        }
    }
    
    
}


