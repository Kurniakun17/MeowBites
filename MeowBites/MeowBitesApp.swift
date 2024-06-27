import SwiftData
import SwiftUI

@main
struct MeowBitesApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
        }
        .modelContainer(for: FoodItem.self)
    }
}
