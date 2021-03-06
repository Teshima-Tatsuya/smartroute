//
//  UnwindSegue.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/01/28.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class UnwindSegue: UIStoryboardSegue {
    
    override func perform() {
        //ViewControllerのインスタンスを取得する
        let firstVCView = destinationViewController.view as UIView!
        let secondVCView = sourceViewController.view as UIView!
        
        //画面の縦横を取得する
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        //戻った先のビューを画面外に設置する。
//        firstVCView.frame = CGRectMake(-screenWidth, 70.0, screenWidth, screenHeight)
        print(firstVCView.frame)
        //戻った先のビューを現在の画面の上にのせる
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        UIView.animateWithDuration(
            0.4,
            animations: { () -> Void in
                //現在のビューを画面外に移動させる。
                secondVCView.frame = CGRectOffset(secondVCView.frame, screenWidth, 0.0)
                //戻った先のビューを画面上に移動させる。
                firstVCView.frame = CGRectOffset(firstVCView.frame, 30, 0.0)
            },
            completion: { (finished: Bool) -> Void in
                //現在の画面を閉じる
                self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
           }
        )
    }

}
