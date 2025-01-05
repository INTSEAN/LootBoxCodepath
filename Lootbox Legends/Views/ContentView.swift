//
//  ContentView.swift
//  Lootbox Legends
//
//
//  Created by SEAN DONOVAN on 12/21/24.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @State var lootboxViewModel = LootboxViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                RealityView { content in
                    content.camera = .spatialTracking
                    await lootboxViewModel.setUp(in: content)
                }
                .onTapGesture { point in
                    lootboxViewModel.handleTap(at: point)
                }
                
                Button("🤑 Tap to add loot box") {
                    let frame = proxy.frame(in: .local)
                    let center = CGPoint(x: frame.midX, y: frame.midY)
                    lootboxViewModel.addLootbox(at: center)
                }
                .fontWeight(.bold)
                .controlSize(.large)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .buttonStyle(BorderedProminentButtonStyle())
                .padding(.bottom, 48)
                
                Text("Try aiming your device at a table")
                    .fontWeight(.medium)
                    .padding()
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 12))
                    .multilineTextAlignment(.center)
                    .opacity(lootboxViewModel.showUnableToPlaceMessage ? 1 : 0)
                
                if let item = lootboxViewModel.currentItem {
                    LootboxItemDetail(item: item) {
                        lootboxViewModel.currentItem = nil
                    }
                    .animation(nil, value: lootboxViewModel.currentItem?.id)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.thinMaterial)
                    .transition(.opacity)
                }
            }
            .animation(.default, value: lootboxViewModel.currentItem?.id)
            .task(id: lootboxViewModel.showUnableToPlaceMessage) {
                if lootboxViewModel.showUnableToPlaceMessage {
                    try? await Task.sleep(for: .seconds(1))
                    withAnimation {
                        lootboxViewModel.showUnableToPlaceMessage = false
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
