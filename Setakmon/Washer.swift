//
//  Washer.swift
//  Setakmon
//
//  Created by 이상윤 on 2017. 7. 30..
//  Copyright © 2017년 이상윤. All rights reserved.
//

import Foundation

class Washer {
    let id: String
    var state: Bool
    var runningTime: Int
    var isFavorate: Bool
    
    init(id: String, state: Bool, runningTime: Int, isFavorate: Bool? = false) {
        self.id = id
        self.state = state
        self.runningTime = runningTime
        self.isFavorate = isFavorate!
    }
    
    func setIsRunning(state: Bool) {
        self.state = state
    }
    
    func setRunningTime(time: Int) {
        self.runningTime = time
    }
    
    func setIsFavorate(isFavorate: Bool) {
        self.isFavorate = isFavorate
    }
    
}
