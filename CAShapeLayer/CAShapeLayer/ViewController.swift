//
//  ViewController.swift
//  CAShapeLayer
//
//  Created by LinTianBao on 16/6/12.
//  Copyright © 2016年 LinTianBao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            
    }
    
    //调节画笔宽度
    @IBAction func changeLineWidth(_ sender: UISlider) {
        
        drawView.width = CGFloat(sender.value)
    }
    
    //选择画笔颜色
    @IBAction func selectColor(_ sender: UISegmentedControl){
        
        switch sender.selectedSegmentIndex {
        case 0:
            drawView.color = UIColor.black
        case 1:
            drawView.color = UIColor.brown
        case 2:
            drawView.color = UIColor.green
        case 3:
            drawView.color = UIColor.red
        case 4:
            drawView.color = UIColor.orange
        case 5:
            drawView.color = UIColor.white
        default:
            drawView.color = UIColor.clear
            
        }
    }
    
    //撤销
    @IBAction func back(_ sender: AnyObject) {
        
        drawView.back()
    }
    
    //将画板截图保存到相册中
    @IBAction func save(_ sender: AnyObject) {
        
        UIGraphicsBeginImageContext(drawView.bounds.size) //开始截取画图板
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let  image:UIImage = UIGraphicsGetImageFromCurrentImageContext()! //截取到图像
        UIGraphicsEndImageContext() //结束截取
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil) //把截取到的图像保存到相册中
        
        //最后提示用户保存成功即可
        let alert = UIAlertView.init(title: "存储照片成功", message: "你已将照片存储到图库中，打开相册程序即可查看", delegate: self, cancelButtonTitle: "OK")
        
        alert.show()
    }
    
    //返回
    @IBAction func forward(_ sender: AnyObject) {
        
        drawView.forward()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

