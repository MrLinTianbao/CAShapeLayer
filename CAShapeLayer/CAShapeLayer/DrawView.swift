//
//  DrawView.swift
//  CAShapeLayer
//
//  Created by LinTianBao on 16/6/12.
//  Copyright © 2016年 LinTianBao. All rights reserved.
//

import UIKit

class DrawView: UIView {

    var width:CGFloat = 3
    var lines = [CAShapeLayer]()
    var cancelLines = [CAShapeLayer]()
    var path:BHBPaintPath!
    var shapeLayer:CAShapeLayer!
    var color:UIColor = UIColor.black
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let startPoint = touches.first?.location(in: self)
        let path = BHBPaintPath()
        path.paintPathWithLineWidth(width, startPoint: startPoint!)
        self.path = path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.backgroundColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = path.lineWidth
        
        self.layer.addSublayer(shapeLayer)
        self.shapeLayer = shapeLayer
        
        lines.append(shapeLayer)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let movePoint = touches.first?.location(in: self)
        self.path.addLine(to: movePoint!)
        self.shapeLayer.path = self.path.cgPath
    }
    
    //撤销
    func back(){
    
        if lines.isEmpty == false{
        
            cancelLines.append(lines.last!)
            let shapeLayer = lines.last!
            shapeLayer.removeFromSuperlayer()
            lines.removeLast()
        }
    }
    
    //返回
    func forward(){
        
        if cancelLines.isEmpty == false{
        
            lines.append(cancelLines.last!)
            let shapeLayer = cancelLines.last!
            self.layer.addSublayer(shapeLayer)
            cancelLines.removeLast()
        }
        
    }

}
