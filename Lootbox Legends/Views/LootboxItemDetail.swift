//
//  LootboxItemDetail.swift
//  Lootbox Legends
//
//  Created by SEAN DONOVAN on 12/21/24.
//

import SwiftUI

struct LootboxItemDetail: View {
    var item: LootboxItem
    var onClose: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text(item.emoji)
                .font(.system(size: 128))
                .padding(.bottom)
            
            Text("You got \(item.title)!")
                .font(.title)
                .fontWeight(.bold)
            
            Text(item.description)
                .foregroundStyle(.secondary)
                .italic()
                .padding(.bottom)
            
            Button("Accept") {
                onClose()
            }
            .controlSize(.large)
            .fontWeight(.bold)
            .buttonStyle(BorderedProminentButtonStyle())
        }
        .frame(maxWidth: 400)
        .padding()
        .multilineTextAlignment(.center)
    }
}

#Preview {
    LootboxItemDetail(item: .items[0]) {}
}
