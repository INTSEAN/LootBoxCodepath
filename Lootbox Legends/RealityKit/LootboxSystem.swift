//
//  LootboxSystem.swift
//  Lootbox Legends
//
//  Created by SEAN DONOVAN on 12/21/24.
//
import Foundation
import RealityKit

class LootboxSystem: System {
    static let tapDecayThreshold: TimeInterval = 0.25
    static let scaleFactor: Float = 0.2
    
    required init(scene: Scene) {}
    
    func update(context: SceneUpdateContext) {
        // TODO
        let query = EntityQuery(where: .has(LootboxComponent.self))
        for entity in context.scene.performQuery(query) {
            var lootboxComponent: LootboxComponent = entity.components[LootboxComponent.self]!
            // Check if we need to decay any taps
            if let date = lootboxComponent.lastUpdate, date.timeIntervalSinceNow < -Self.tapDecayThreshold, lootboxComponent.tapsReceived > 0 {
                lootboxComponent.tapsReceived -= 1
                entity.components.set(lootboxComponent)
            }
            // Scale entities according to how many times they've been tapped
            entity.scale = SIMD3(repeating: 1 + Self.scaleFactor * Float(lootboxComponent.tapsReceived))
        }
    }
}
