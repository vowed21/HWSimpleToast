//
//  ViewController.swift
//  HWSimpleToast
//
//  Created by HyunWoo Kim on 2016. 1. 11..
//  Copyright © 2016년 KokohApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isRedColor = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickSimpleShow(sender: AnyObject) {
        HWSimpleToast(message: "It's Very Simple\nLast settings are remain").show()
    }
    
    @IBAction func clickPositionTop(sender: AnyObject) {
        
        HWSimpleToast(message: "Toast on Top").setPosition(.Top).show()
    }
    
    @IBAction func clickPositionCenter(sender: AnyObject) {
        
        HWSimpleToast(message: "Toast Position Center").setPosition(.Center).show()
    }
    
    @IBAction func clickPositionBottom(sender: AnyObject) {
        
        HWSimpleToast(message: "Toast Position Bottom").setPosition(.Bottom).show()
    }
    
    @IBAction func clickLongDuration(sender: AnyObject) {
        
        HWSimpleToast(message: "Set duration  5second\nYou can change").setDuration(5).show()
    }
    
    @IBAction func clickRed(sender: AnyObject) {
        HWSimpleToast(message: "Background : Red\nText : White").setBackgroundColor(UIColor.redColor()).setTextcolor(UIColor.whiteColor()).show()
    }
    
    
    @IBAction func clickLightGray(sender: AnyObject) {
        
        HWSimpleToast(message: "Background : GroupedTableGray\nFontColor:White").setBackgroundColor(UIColor.groupTableViewBackgroundColor()).setTextcolor(UIColor.blackColor()).show()
        
    }
    
    
    
    
    
    
}

