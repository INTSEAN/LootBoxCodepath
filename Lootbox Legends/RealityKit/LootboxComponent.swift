//
//  LootboxComponent.swift
//  Lootbox Legends
//
//  Created by SEAN DONOVAN on 12/21/24.
//

import Foundation
import RealityKit

struct LootboxComponent: Component {
    var tapsReceived: Int = 0 {
        didSet {
            lastUpdate = Date()
        }
    }
    
    let requiredTaps: Int
    
    var lastUpdate: Date?
}
