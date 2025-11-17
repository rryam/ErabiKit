import XCTest
import SwiftUI
@testable import ErabiKit

final class ErabiKitTests: XCTestCase {
    func testExample() {
        var body: some View {
            ScrollView {
                ErabiKit.AboutRow(
                    title: "Made with ❤️ by Rudrank Riyam",
                    accessibilityTitle: "Made with love by Rudrank Riyam"
                )
            }
        }
    }
    static var allTests = [
        ("testExample", testExample)
    ]
}
