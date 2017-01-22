//
//  ViewController.swift
//  RedDotView
//
//  Created by 宁国通 on 2017/1/20.
//  Copyright © 2017年 宁国通. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vRedDotView: UIView!
    @IBOutlet weak var vRedNumberView: UIView!
    
    @IBOutlet weak var createNumberRedDotBtn: UIButton!
    @IBOutlet weak var createRedDotBtn: UIButton!
    
    @IBOutlet weak var hidOrShowRedDotBtn: UIButton!
    
    var isHide:Bool  = false
    
    var vRDView:RedDotView!,vNRDView:RedDotView!
    var cRDView:RedDotView!,cNRDView:RedDotView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vRDView = getRedDotView(x: 0, y: 0, redDotType: .Dot)
        self.vNRDView = getRedDotView(x: 0, y: 0, redDotType: .Round)
        
        self.vRedDotView.addSubview(vRDView)
        self.vRedNumberView.addSubview(vNRDView)
        
        self.vNRDView.setDotValue(number: 100)
    }
    
    /// 创建数字小红点
    @IBAction func createNumberRedDotAction(_ sender: UIButton) {
        if self.cNRDView == nil {
            self.cNRDView = getRedDotView(x: 100, y: vRedDotView.frame.maxY + 20, redDotType: .Round)
            self.cNRDView.backgroundColor = UIColor.yellow
            self.cNRDView.setDotValue(number: 1)
            self.view.addSubview(cNRDView)
        }
    }
    
    /// 创建小红点
    @IBAction func createRedDotAction(_ sender: UIButton) {
        if self.cRDView ==  nil {
            self.cRDView = getRedDotView(x: 10, y: vRedDotView.frame.maxY + 20, redDotType: .Dot)
            self.cRDView.backgroundColor = UIColor.blue
            self.view.addSubview(self.cRDView)
        }
    }
    
    /// 显示或者隐藏isHide
    @IBAction func hidOrShowRedDotAction(_ sender: UIButton) {
        
        if self.vRDView != nil {
            self.vRDView.isHide = !vRDView.redDotIsHide()
            self.vNRDView.isHide = !vNRDView.redDotIsHide()
        }
        
        if self.cRDView != nil {
            self.cRDView.isHide = !cRDView.redDotIsHide()
        }
        
        if self.cNRDView != nil {
            self.cNRDView.isHide = !cNRDView.redDotIsHide()
        }
        
    }
    
    
    /// 加数量
    @IBAction func add(_ sender: UIButton) {
        if self.vNRDView != nil {
            self.vNRDView.add()
        }
        
        if self.cNRDView != nil {
            self.cNRDView.add()
        }

    }
    /// 减数量
    @IBAction func reduc(_ sender: UIButton) {
        if self.vNRDView != nil {
            self.vNRDView.reduc()
        }
        
        if self.cNRDView != nil {
            self.cNRDView.reduc()
        }

    } 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    fileprivate func getRedDotView(x:CGFloat,y:CGFloat,redDotType:RedDotViewType)->RedDotView{
        let redDotFrame:CGRect = CGRect.init(x: x, y: y, width: self.vRedNumberView.frame.width, height: self.vRedNumberView.frame.height)
        return RedDotView.init(frame: redDotFrame, inViews: nil, redDotType: redDotType)
    }
    
}

