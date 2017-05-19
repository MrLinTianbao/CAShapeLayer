//
//  BHBPaintPath.swift
//  CAShapeLayer
//
//  Created by LinTianBao on 16/6/12.
//  Copyright © 2016年 LinTianBao. All rights reserved.
//

import UIKit

class BHBPaintPath: UIBezierPath {

    func paintPathWithLineWidth(_ width:CGFloat,startPoint:CGPoint) -> AnyObject{
    
        self.lineWidth = width
        self.lineCapStyle = CGLineCap.round //线条拐点
        self.lineJoinStyle = CGLineJoin.round //终点处理
        
        self.move(to: startPoint)
        
        return self
    
    }
    
}
