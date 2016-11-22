//
//  RCFactoryHandler.swift
//  TestRCShapeCreator
//
//  Created by Ryan Cocuzzo on 11/22/16.
//  Copyright © 2016 rcocuzzo8. All rights reserved.
//

import Foundation
import UIKit

class RCFactoryHandler {
    
    var factory: RCShapeFactory!
    
    init() {
        
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = UIScreen.main.bounds.height
        
        factory = RCShapeFactory(frame: CGRect(
            origin: CGPoint(x: 50, y: 50),
            size: CGSize(width: width-100, height: height-100)))
        
        
        let appDelegate = UIApplication.shared.delegate// as! AppDelegate
        appDelegate?.window??.rootViewController?.view.addSubview(factory)
        
        
    }
    
    func adjustDimensions(width: Float, height: Float){
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let screenHeight: CGFloat = UIScreen.main.bounds.height
        if width < Float(screenWidth) && height < Float(screenHeight){
            
            let margin = (Float(screenWidth) - width) / 2
            
            let marginH = (Float(screenHeight) - height) / 2
            
            print("Creating frame:\nx: \(CGFloat(margin))\ny: \(CGFloat(marginH))\nwidth: \(CGFloat(width))\nheight: \(CGFloat(height))")
            factory.frame = CGRect(x:  CGFloat(margin), y: CGFloat(marginH), width: CGFloat(width), height: CGFloat(height))
        } else {
            factory.frame = CGRect(x:  0, y: 0, width: screenWidth, height: screenHeight)
        }
        
    }
    
    func adjustToFilledViewWithMargins(horizontalMargin: Float, verticalMargin: Float) {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let screenHeight: CGFloat = UIScreen.main.bounds.height
        if horizontalMargin < Float(screenWidth/2) && verticalMargin < Float(screenHeight/2) {
            let width = Float(screenWidth) - (horizontalMargin*2)
            let height = Float(screenHeight) - (verticalMargin*2)
            factory.frame = CGRect(x:  CGFloat(horizontalMargin), y: CGFloat(verticalMargin), width: CGFloat(width), height: CGFloat(height))
            
        } else {
            factory.frame = CGRect(x:  0, y: 0, width: screenWidth, height: screenHeight)
        }
    }
    
    func adjustLineColor(to: UIColor) {
        factory.lineColor = to
    }
    
    
    
    func addPoint(x: Float, y: Float) {
        let point = CGPoint(x: CGFloat(x), y: CGFloat(y))
        self.factory.myShape.addPoint(point: point)
    }
    
    func addPoint(point: CGPoint) {
        self.factory.myShape.addPoint(point: point)
    }
    
    func adjustLineWidth(to: Int){
        factory.lineWidth = to
    }
    
    func adjustBackgroundColor(to: UIColor){
        factory.viewBackgroundColor = to
    }
    
}

