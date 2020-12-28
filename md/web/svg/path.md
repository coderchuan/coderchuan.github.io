## path命令 
* 直线命令
    * {M|m} x y
        * 功能:将当前坐标移动到指定的位置，不会在移动路径中画线
        * 参数
            * 起点
                * A:当前绝对坐标作为起点
                * a:以当前绝对坐标作为相对坐标原点 
            * 终点:x y 
    * {L|l} x y 
        * 功能:将当前坐标移动到指定的位置，并在移动路径中画直线 
        * 参数
            * 起点
                * L:当前绝对坐标作为起点
                * l:以当前绝对坐标作为相对坐标原点 
            * 终点:x y 
    * {H|h} x 
        * 功能:将当前坐标沿水平轴移动到指定的位置，并在移动路径中画直线 
        * 参数
            * 起点
                * H:当前绝对坐标作为起点
                * h:以当前绝对坐标作为相对坐标原点 
            * 终点:x
    * {V|v} y 
        * 功能:将当前坐标沿纵轴移动到指定的位置，并在移动路径中画直线  
        * 参数
            * 起点
                * V:当前绝对坐标作为起点
                * v:以当前绝对坐标作为相对坐标原点 
            * 终点:y
    * {Z|z}
        * 功能:将当前坐标沿纵轴移动到整个路径的起点位置，并在移动路径中画直线  
        * 参数:无 
* 曲线命令 
    * {C|c} x1 y1, x2 y2, x y 
        * 功能:三次贝塞尔曲线
        * 参数
            * 起点
                * C:当前绝对坐标作为起点
                * c:以当前绝对坐标作为相对坐标原点 
            * 起点控制点:x1 y1
            * 终点控制点:x2 y2
            * 终点:x y 
    * {S|s} x2 y2,x y 
        * 功能:简易三次贝塞尔曲线
        * 参数
            * 起点
                * S:当前绝对坐标作为起点
                * s:以当前绝对坐标作为相对坐标原点 
            * 起点控制点
                * 如果上一个命令是`S|s|C|c`中的一个,则起始控制点为上一个命令的第二个控制点与上一个命令的终点坐标的中心对称点 
                *  如果上一个命令不是`S|s|C|c`中的一个,则起始控制点为当前命令的起点 
            * 终点控制点:x2 y2
            * 终点:x y 
    * {Q|q} x1 y1, x y 
        * 功能:二次贝塞尔曲线
        * 参数
            * 起点
                * Q:当前绝对坐标作为起点
                * q:以当前绝对坐标作为相对坐标原点 
            * 控制点:x1 y1
            * 终点:x y  
    * {T|t} x y 
        * 功能:简易二次贝塞尔曲线
        * 参数
            * 起点
                * T:当前绝对坐标作为起点
                * t:以当前绝对坐标作为相对坐标原点 
            * 控制点
                * 如果上一个命令是`Q|q|T|t`中的一个,则控制点为上一个命令的控制点与上一个命令的终点坐标的中心对称点 
                *  如果上一个命令不是`Q|q|T|t`中的一个,则控制点为当前命令的起点。效果是一条直线 
            * 终点:x y  
    * {A|a} rx ry x-axis-rotation large-arc-flag sweep-flag x y
        * 功能:弧线(椭圆或圆的线条的一部分)
        * 参数
            * 起点
                * A:当前绝对坐标作为起点
                * a:以当前绝对坐标作为相对坐标原点  
            * 横轴半径:rx
            * 纵轴半径:ry 
            * 椭圆旋转的角度:x-axis-rotation,`[-180,180]` 
            * 大角弧线或小角弧线:large-arc-flag,`1|0`,大|小
            * 绘制方向:sweep-flag,`1|0`,顺|逆 
            * 终点:x y