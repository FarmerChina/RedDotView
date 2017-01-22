# RedDotView
swift 3.0 小红点和小圆圈数字提示，大部分购物APP的发货数量代收货数量的提示 


#创建代码 
let redDotFrame:CGRect = CGRect.init(x: x, y: y, width: self.vRedNumberView.frame.width, height: self.vRedNumberView.frame.height) //创建一个CGRect
//需要传入frame,提供可以传入其它view，传入一个类型：是小红点的形式展现还是数字圆圈的形式展示
RedDotView.init(frame: redDotFrame, inViews: nil, redDotType: redDotType) //创建view

#设置值
控件view.setDotValue(number: 100)

#提供add() 和 reduc（）两个函数来进行加减操作

#提供isHide变量来控制显示或者隐藏提示view


![image](https://github.com/FarmerChina/RedDotView/blob/master/reddotview.gif)  
