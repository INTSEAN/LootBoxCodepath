//
//  LootboxViewModel.swift
//  Lootbox Legends
//
//  Created by SEAN DONOVAN on 12/21/24.
//

import SwiftUI
import RealityKit
import OSLog

private let logger = Logger(subsystem: "Lootbox Legends", category: "LootboxViewModel")


@Observable @MainActor class LootboxViewModel {
    var currentItem: LootboxItem?
    var showUnableToPlaceMessage = false
    
    var realityViewContent: RealityViewCameraContent?
    var anchor: AnchorEntity?
    //
    var lootboxTemplate: Entity?
    
    func setUp(in realityViewContent: RealityViewCameraContent) async {
        self.realityViewContent = realityViewContent
        
        // TODO: Set up a template lootbox entity in step 1
        let lootboxTemplate = try! await ModelEntity(named: "lootbox")
        self.lootboxTemplate = lootboxTemplate
        // TODO: Add collision and physics body components in step 3
        
        // TODO: Configure the lootbox template with a LootboxComponent in step 4
        lootboxTemplate.components.set(LootboxComponent(requiredTaps: 5))
        // Create horizontal table anchor for the content
        let anchor = AnchorEntity(.plane(.horizontal, classification: .table, minimumBounds: SIMD2<Float>(0.2, 0.2)))
        anchor.components.set(CollisionComponent(shapes: [.generateBox(width: 100, height: 0.001, depth: 100)]))
        
        // Add a physics body for the table
        var tablePhysicsBodyComponent = PhysicsBodyComponent()
        tablePhysicsBodyComponent.mode = .static
        anchor.components.set(tablePhysicsBodyComponent)
        /// LOOT BOX PHYSICS
        var lootboxPhysicsBodyComponent = PhysicsBodyComponent()
        lootboxPhysicsBodyComponent.massProperties.mass = 0.5
        lootboxPhysicsBodyComponent.mode = .dynamic
        lootboxTemplate.components.set(lootboxPhysicsBodyComponent)
        
        // Add the anchor to the scene and view model
        realityViewContent.entities.append(anchor)
        self.anchor = anchor
    }
    
    func addLootbox(at point: CGPoint) {
        // TODO: Add a lootbox entity in step 1
        guard let anchor, let realityViewContent, let lootboxTemplate else {
            return
        }
        let hits = realityViewContent.hitTest(point: point, in: .local, query: .all)
        guard let hit = hits.first(where: { $0.entity === anchor }) else {
            showUnableToPlaceMessage = true
            return
        }
        let position = anchor.convert(position: hit.position, from: nil)
        let lootbox = lootboxTemplate.clone(recursive: true)
        anchor.addChild(lootbox)
        lootbox.position = position + [0, 0.5, 0]
        // TODO: Place the lootbox entity relative to the camera in step 2
    }
    
    func handleTap(at position: CGPoint) {
        // TODO: Handle user input in step 5
        guard let realityViewContent else {
            return
        }

        let hits = realityViewContent.hitTest(point: position, in: .local, query: .all)
        guard let hit = hits.first(where: { $0.entity.components.has(LootboxComponent.self) }) else {
            return
        }
        hit.entity.components[LootboxComponent.self]!.tapsReceived += 1
        let lootboxComponent: LootboxComponent = hit.entity.components[LootboxComponent.self]!
        if lootboxComponent.tapsReceived >= lootboxComponent.requiredTaps {
            hit.entity.removeFromParent()
            currentItem = LootboxItem.items.randomElement()
        }
    }
    
}
