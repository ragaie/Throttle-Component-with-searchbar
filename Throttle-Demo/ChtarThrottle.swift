//
//  ChtarThrottle.swift
//  Throttle-Demo
//
//  Created by Ragaie alfy on 5/9/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit

class ChtarThrottle: NSObject {
    
    private var timer : Timer?  = nil {
        willSet {
            timer?.invalidate()
        }
    }
    private var blockEx : ()->() = {}
    private var interval : Double!
    override init() {
        super.init()
    }
    
    func excute(period : Double,block :@escaping ()->()){
        blockEx = block
        interval = period
        timer = Timer.scheduledTimer(timeInterval: period, target: self, selector: #selector(self.update),  userInfo: nil, repeats: false)
    }
    
    
    func start(){
        timer?.fire()
    }
    
    
    // must be internal or public.
    @objc private  func update() {
        blockEx()
    }
    
    
    func stop(){
        
        timer = nil

        //timer?.invalidate()
    }
    
    
}
