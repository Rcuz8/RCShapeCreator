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
    
    init(_origin: CGPoint) {
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
                return $0.0.x < $0.1.x
            } else {
                return $0.0.y > $0.1.y
            }
        }
        minY = Float(UIScreen.main.bounds.minY)
        maxY = Float(UIScreen.main.bounds.maxY)
        minX = Float(UIScreen.main.bounds.minX)
        maxX = Float(UIScreen.main.bounds.maxX)
        for point in points {
            let px = Float(point.x)
            let py = Float(point.y)
            if px < Float(minX) {
                minX = px
            }
            if px > Float(maxX) {
                maxX = px
            }
            
            if py < Float(minY) {
                minY = py
            }
            if py > Float(maxY) {
                maxY = py
            }
            
        }
        
        print("MIN:")
        print(points[0].x)
        let min = points[0].x
        let max = points[pointsCount-1].x
        let Ymin = points[0].y
        let Ymax = points[pointsCount-1].y
        print("MAX:")
        print(points[pointsCount-1].x)
        width = Float(max)-Float(min)
        maxX = Float(max)
        minX = Float(min)
        minY = Float(Ymin)
        maxY = Float(Ymax)
        length = Float(Ymin)-Float(Ymax)
        if maxX != minX && maxY != minY {
            origin = CGPoint(x: CGFloat(maxX-minX), y: CGFloat(minY-maxY))
        } else {
            if maxX != minX && minY == maxY {
                origin = CGPoint(x: CGFloat(maxX-minX), y: CGFloat(minY))
            } else if maxX == minX && minY != maxY{
                origin = CGPoint(x: CGFloat(minX), y: CGFloat(minY-maxY))
            } else {
                print("Min Y = \(minY), max Y = \(maxY).. Looking for origin. Result should be in middle of them or same if one point")
                print("Number of points: \(pointsCount)")
                origin = points[0]
            }
        }
        self.printShapeDescription()
        
    }
    
    var origin: CGPoint!
    
    var minX: Float!
    
    var maxX: Float!
    
    var minY: Float!
    
    var maxY: Float!
    
    var length: Float!
    
    var width: Float!
    
    func printShapeDescription() {
        print("Shape Description:")
        print("Width: \(width!)")
        print("Height: \(length!)")
        print("X Range: (\(minX!), \(maxX!))")
        print("Y Range: (\(minY!), \(maxY!))")
        print("Origin: (\(origin!.x), \(origin!.y))")
    }
    
}
