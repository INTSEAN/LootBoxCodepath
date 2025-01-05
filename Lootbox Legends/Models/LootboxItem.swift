//
//  LootboxItem.swift
//  Lootbox Legends
//
//  Created by SEAN DONOVAN on 12/21/24.
//

import SwiftUI

struct LootboxItem: Identifiable {
    let id: String
    var emoji: String
    var title: String
    var description: LocalizedStringKey
    
    static let items: [LootboxItem] = [
        .init(id: "collectible", emoji: "🖼️", title: "Useless Collectible", description: "We probably generated it with AI anyway."),
        .init(id: "chicken", emoji: "🤮", title: "1920 Commons Chicken", description: "oops"),
        .init(id: "idea", emoji: "💡", title: "Million Dollar Idea", description: "Too bad it's our intellectual property."),
        .init(id: "rare", emoji: "💎", title: "Rare Skin", description: "Now you can show off how much you like wasting money!"),
        .init(id: "dining-dollars", emoji: "💰", title: "$10 Dining Dollars", description: "[Tap here to claim now!](https://www.youtube.com/watch?v=xvFZjo5PgG0)"),
        .init(id: "lime", emoji: "🍋‍🟩", title: "Lime", description: "Let's hope you're on iOS 17.4"),
        .init(id: "emptiness", emoji: "🫥", title: "a feeling of emptiness", description: ""),
        .init(id: "thanks", emoji: "❤️", title: "a thank you message from the CIS 1951 staff", description: "Thanks for taking our course, and we hope you enjoyed it! Best of luck in the future, whether you continue developing for iOS or not."),
    ]
}
