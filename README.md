# Lootbox Legends

Welcome to **Lootbox Legends**, an AR-based experience built with the latest RealityKit APIs on iOS 18 and above. In this app, you can place, tap, and open loot boxes in augmented reality. Each loot box reacts to physics, can be stacked, and expands when tapped—until it’s finally opened to reveal a random item.

## Getting Started

1. **Clone the repo** and open it in Xcode 15 or higher.
2. Ensure you have a **physical iOS 18+ device** for testing, since the app relies on camera and motion sensors unavailable on Simulator.
3. In the project settings, **update the Bundle Identifier** to something unique (e.g., `edu.upenn.seas.cis1951.Lootbox-Legends-YourNameHere`).
4. On a real device, **enable camera access** and set a descriptive **camera usage description** (purpose string) in the app’s `Info.plist` settings.

## Features

- **Place Loot Boxes**  
  Tap the “Add Loot Box” button to create a new loot box in front of you. The app uses RealityKit's hit testing to position the box accurately on flat surfaces.

- **Physics-Driven Interactions**  
  Each loot box drops from above and bounces on surfaces, thanks to RealityKit’s physics components.

- **Interactive Tapping**  
  Tap repeatedly on a loot box to open it. When it opens, it reveals a random item (just for fun!). Tapped boxes also scale up on each tap—then gradually shrink if left alone.

- **Custom Components & Systems**  
  We use a `LootboxComponent` to track how many taps a box has received and how many are needed to open it. A `LootboxSystem` is registered to decay taps over time and update each box’s scale on every frame.

## App Structure

- **`LootboxLegendsApp.swift`**  
  Initializes the app and registers both the custom `LootboxComponent` and the `LootboxSystem`.

- **`LootboxViewModel.swift`**  
  Manages placement, retrieval, and updates to loot boxes in the scene. Provides logic for handling user taps, adding new boxes, and revealing items.

- **`LootboxComponent.swift`**  
  A custom RealityKit component holding loot box–specific data (taps, required taps, last update date).

- **`LootboxSystem.swift`**  
  A RealityKit system that decays tap counts if boxes are left un-tapped for too long and scales each box according to its current tap count.

- **`Models/lootbox.usdz`**  
  The 3D model used for displaying loot boxes in AR.

## Usage

1. **Run the App** on a physical iOS 18 device.  
2. **Aim your device** at a flat surface (like a table).  
3. **Tap “Add Loot Box”** to place a loot box into the scene.  
4. **Tap the Loot Box** repeatedly to open it.  
   - Each tap makes it scale up slightly.  
   - Once you reach enough taps, the box opens, disappears, and an item is revealed.  
5. **Try stacking multiple boxes** on top of each other or place them around your environment.

## Tips

- If you receive a **“Couldn’t place loot box”** message, make sure you’re aiming at a valid surface.
- You can tweak **mass properties** and other physics parameters in `LootboxViewModel.swift` for different behaviors.
- Customize your loot table in `LootboxItem.swift` (or wherever random items are defined) to add your own fancy items.

## Contributing

We’d love contributions to improve interactions, add more animations, or expand features. Feel free to create an issue or open a pull request with any suggestions or fixes.

## License

This project is distributed under the MIT License. See [`LICENSE`](LICENSE) for more information.

---

Enjoy building and placing your own AR loot boxes! Have fun experimenting with RealityKit to bring objects to life in augmented reality.
