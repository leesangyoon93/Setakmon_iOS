//
//  WasherModel.swift
//  Setakmon
//
//  Created by 이상윤 on 2017. 8. 13..
//  Copyright © 2017년 이상윤. All rights reserved.
//

import Foundation
import FirebaseDatabase

class WasherRoomModel {
    
    var washers = [Washer]()
    
    var washerUpdateDelegate: WasherUpdateDeleagte?
    
    func updateWasher() {
        let ref = FIRDatabase.database().reference()
        let washerRoomRef = ref.child("namje")
        
        washerRoomRef.observe(.value, with: { (commerceSnapshot) in
            self.washers.removeAll()
            
            if let dic = commerceSnapshot.value as? [String: AnyObject] {
                for (_, value) in dic {
                    for (key, val) in (value as! [String: AnyObject]) {
                        let index = key.index(key.startIndex, offsetBy: 7)
                        let id = key.substring(from: index)
                        
                        let washer: Washer = Washer(id: id, state: val["state"] as! Bool,
                                                    runningTime: val["oper_time"] as! Int)
                        self.washers.append(washer)
                    }
                }
                self.washerUpdateDelegate?.update(self.washers)
            } else {
                self.washerUpdateDelegate?.update(self.washers)
            }
        })
    }
}
