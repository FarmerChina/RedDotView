//
//  RedDotView.swift
//  KuPoMarket
//
//  Created by 宁国通 on 2017/1/3.
//  Copyright © 2017年 宁国通. All rights reserved.
//

import UIKit
import SnapKit

enum RedDotViewType:Int
{
    case Dot = 0//点
    case Round = 1//圆
}

///带红点的view，用于消息提示
class RedDotView: UIView {
    
    
    /// 获取到值
    func getValue() ->Int {
        var tmp:String = self.redDotLabel.text ?? "0"
        if tmp.contains("+") {
            tmp = tmp.components(separatedBy: "+")[1]
        }
        return Int(tmp)!
    }
    
    
    /// 是否隐藏
    var isHide:Bool!{
        didSet{
            self.redDotLabel.isHidden = isHide
        }
    }
   
    
    /// 加
    func add() {
        self.tmpNumber +=  1
        self.setDotValue(number: self.tmpNumber )
    }
    
    /// 减
    func reduc() {
        self.tmpNumber -= 1
        self.setDotValue(number: self.tmpNumber )
    }
    
    /// 设置小红点的数量
    /// - Parameter number: 数量
    func setDotValue(number:Int){
        if  number <= 0 {
            self.redDotLabel.isHidden = true
        }else{
            self.tmpNumber = number
            print("\(self.tmpNumber)")
            self.redDotLabel.isHidden = false
            var tmp:String = "0"
            if self.redDotType == .Dot {
                tmp = "0"
                self.redDotLabel.textColor = UIColor.clear
            }else{
                if number  > 99 {
                    tmp = "+99"
                }else{
                    tmp = "\(number)"
                }
            }
            self.redDotLabel.text = tmp
        }
    }
    
    
    /// 获取当前小红点view是否隐藏
    /// - Returns: true 表示隐藏 反之 显示
    func  redDotIsHide()->Bool{
        let isHide:Bool = self.redDotLabel.isHidden
        print(isHide)
        return isHide
    }
    
    
    
    ///通过打点调用的方式赋值
    var inViews:[UIView]! {
        didSet{
            if inViews.count > 0 {
                for v in self.subviews {
                    v.removeFromSuperview()//移除所有的view
                }
                for v in inViews {
                    self.addSubview(v)
                }
            }
            initView()
        }
    }
    
    
    fileprivate var redDotLabel:UILabel!
    var redDotType:RedDotViewType! = .Dot
    fileprivate var tmpNumber:Int  = 0
    
    /**
     inView:需要放到当前view的控件
     */
    init(frame:CGRect?,inViews:[UIView]?,redDotType:RedDotViewType) {
        if nil == frame {
            super.init(frame: CGRect.init(x: 0, y: 0, width: 60, height: 54))
        }else{
            super.init(frame: frame!)
        }
        self.redDotType = redDotType
        if nil != inViews && (inViews?.count)! >  0 {
            for v in self.subviews {
                v.removeFromSuperview()//移除所有的view
            }
            for v in inViews! {
                self.addSubview(v)
            }
        }
        initView()
    }
    
    fileprivate override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     初始化view
     **/
    fileprivate func initView(){
        self.redDotLabel = UILabel.init()//初始化一个显示顶部的数量的label
        self.redDotLabel.textAlignment = .center
        self.redDotLabel.font = UIFont.systemFont(ofSize: 10)
        self.addSubview(self.redDotLabel)
        var redDotWH:Int = 8//chu'shi
        if self.redDotType == .Dot {//点点的模式
            self.redDotLabel.backgroundColor = UIColor.red
            self.redDotLabel.snp.makeConstraints { (make) in
                make.width.height.equalTo(redDotWH)
                make.top.right.equalTo(self)
            }
        } else {//如果是圆圈带数字的模式
            self.redDotLabel.backgroundColor = UIColor.white
            self.redDotLabel.textColor = UIColor.red
            self.redDotLabel.layer.borderWidth = 1
            self.redDotLabel.layer.borderColor = UIColor.red.cgColor
            redDotWH = 25
            self.redDotLabel.snp.makeConstraints { (make) in
                make.width.height.equalTo(redDotWH)
                make.top.right.equalTo(self)
            }
        }
        //设置为圆形
        self.redDotLabel.layer.cornerRadius = CGFloat(redDotWH / 2)
        self.redDotLabel.layer.masksToBounds = true
        self.redDotLabel.layer.shouldRasterize = true
        self.redDotLabel.layer.rasterizationScale = UIScreen.main.scale
    }
    
}
