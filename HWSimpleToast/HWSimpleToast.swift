//
//  HWSimpleToast.swift
//  HWSimpleToast
//
//  Created by HyunWoo Kim on 2015. 12. 9..
//  Copyright © 2015년 KokohApps Inc. All rights reserved.
//

import UIKit

public enum HWSimpleToastPosition: Int {
    case Top
    case Center
    case Bottom
}


public class HWSimpleToast {
    
    private let mMessage: String
    private static var BackgroundColor = UIColor.blackColor()
    private static var TextColor = UIColor.whiteColor()
    private static var ToastDuration: NSTimeInterval = 3
    private static var Position = HWSimpleToastPosition.Center
    
    private static let ANIMATION_DURATION = 0.4
    private static let PADDING :CGFloat = 8
    private static let CORNER_RADIUS : CGFloat = 6
    private static let FONT_SIZE: CGFloat = 15
    private static let MAX_SIZE_RATIO_FROM_WINDOW :CGFloat = 0.75
    
    
    public init(message: String){
        mMessage = message
    }
    
    public func setDuration(duration: NSTimeInterval) -> HWSimpleToast {
        HWSimpleToast.ToastDuration = duration
        return self
    }
    
    public func setBackgroundColor(color: UIColor) -> HWSimpleToast {
        HWSimpleToast.BackgroundColor = color
        return self;
    }

    public func setPosition(position: HWSimpleToastPosition) -> HWSimpleToast {
        HWSimpleToast.Position = position
        return self
    }
    
    public func setTextcolor(color: UIColor) -> HWSimpleToast {
        HWSimpleToast.TextColor = color
        return self
    }
    
    
    
    
    public func show(){
        let toastView = makeToast()
        toastView.center = centerPoint()
        toastView.alpha = 0
        
        UIApplication.sharedApplication().delegate?.window??.addSubview(toastView)
        
        UIView.animateWithDuration(HWSimpleToast.ANIMATION_DURATION, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            toastView.alpha = 0.8
            }) { (result) -> Void in
                self.removeToast(toastView)
        }
    }
    
    private func removeToast(toastView: UIView){
        UIView.animateWithDuration(HWSimpleToast.ANIMATION_DURATION, delay: HWSimpleToast.ToastDuration, options: .CurveEaseIn, animations: { () -> Void in
            toastView.alpha = 0
            }) { (result) -> Void in
                toastView.removeFromSuperview()
        }
    }

    
    private func centerPoint() -> CGPoint {
        let posX = UIScreen.mainScreen().bounds.width / 2
        let screenHeight = UIScreen.mainScreen().bounds.height
        
        var posY:CGFloat
        
        switch HWSimpleToast.Position {
        case .Top: posY = screenHeight / 4
        case .Center: posY = screenHeight / 2
        case .Bottom: posY = screenHeight / 4 * 3
        }
        
        return CGPointMake(posX, posY)
    }
    
    
    
    
    
    
    private func makeToast() -> UIView {
        
        let windowWidth = UIScreen.mainScreen().bounds.width
        let windowHeight = UIScreen.mainScreen().bounds.height
        
        
        let viewBackground = UIView()
        viewBackground.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleTopMargin, .FlexibleBottomMargin]
        viewBackground.layer.cornerRadius = HWSimpleToast.CORNER_RADIUS
        viewBackground.backgroundColor = HWSimpleToast.BackgroundColor
        
        
        //그림자관련.
        viewBackground.layer.shadowColor = UIColor.blackColor().CGColor
        viewBackground.layer.shadowOpacity = 0.9
        viewBackground.layer.shadowRadius = HWSimpleToast.CORNER_RADIUS
        viewBackground.layer.shadowOffset = CGSizeMake(3, 3)
        
        
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFontOfSize(HWSimpleToast.FONT_SIZE)
        label.textAlignment = .Natural
        label.lineBreakMode = .ByWordWrapping
        label.textColor = HWSimpleToast.TextColor
        label.backgroundColor = UIColor.clearColor()
        label.text = mMessage
        label.alpha = 0.9
        
        let maxSizeMessage = CGSizeMake(windowWidth * HWSimpleToast.MAX_SIZE_RATIO_FROM_WINDOW, windowHeight * HWSimpleToast.MAX_SIZE_RATIO_FROM_WINDOW)
        let expectedSizeMessage = sizeForString(mMessage, font: label.font, constrainedToSize: maxSizeMessage, lineBreakMode: label.lineBreakMode)
        
        label.frame = CGRectMake(HWSimpleToast.PADDING, HWSimpleToast.PADDING, expectedSizeMessage.width, expectedSizeMessage.height)
        
        let backgroundWidth = label.bounds.width + (HWSimpleToast.PADDING * 2)
        let backgroundHeight = label.bounds.height + (HWSimpleToast.PADDING * 2)
        viewBackground.frame = CGRectMake(0, 0, backgroundWidth, backgroundHeight)

        viewBackground.addSubview(label)
        
        return viewBackground
    }
    
    
    
    
    private func sizeForString(msg: String, font:UIFont, constrainedToSize:CGSize, lineBreakMode: NSLineBreakMode) -> CGSize {
        
        let string = NSString(string: msg)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        
        let attributes = [NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle]
        
        let boundingRect = string.boundingRectWithSize(constrainedToSize, options: .UsesLineFragmentOrigin, attributes: attributes, context: nil)
        
        let widthFloat = ceilf(Float(boundingRect.size.width))
        let heightFloat = ceilf(Float(boundingRect.size.height))
        
        return CGSizeMake(CGFloat(widthFloat), CGFloat(heightFloat))
    }
    
    
    

}
