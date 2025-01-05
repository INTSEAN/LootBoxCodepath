//
//  LootboxLegends.swift
//  Lootbox Legends
//
//
//  Created by SEAN DONOVAN on 12/21/24.
//

import UIKit
import SwiftUI

@main
struct LootboxLegends: App {
    init() {
        // TODO: Register LootboxComponent in step 4
        // TODO: Register LootboxSystem in step 6
        LootboxComponent.registerComponent()
        LootboxSystem.registerSystem()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
