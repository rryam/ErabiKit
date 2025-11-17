# ErabiKit

ErabiKit (選び) is a beautiful, customizable SwiftUI settings screen library for iOS. The name comes from the Japanese word for "choice" or "selection."

<p align="center">
  <img src="https://img.shields.io/badge/Swift-6.0+-fa7343?style=flat&logo=swift&logoColor=white" alt="Swift 6.0+">
  <br>
  <img src="https://img.shields.io/badge/iOS-15.0+-000000?style=flat&logo=apple&logoColor=white" alt="iOS 15.0+">
  <img src="https://img.shields.io/badge/SPM-compatible-brightgreen?style=flat" alt="SPM compatible">
</p>

## Features

- Native SwiftUI components
- Customizable gradient overlays
- No dependencies
- iOS 15.0+
- Dark mode support
- Works on iPad and landscape
- Built with accessibility in mind

## Support

Love this project? Check out my books to explore more of AI and iOS development:
- [Exploring AI for iOS Development](https://academy.rudrank.com/product/ai)
- [Exploring AI-Assisted Coding for iOS Development](https://academy.rudrank.com/product/ai-assisted-coding)

Your support helps to keep this project growing!

## Requirements

- iOS 15.0+
- Swift 5.5+
- Xcode 13.0+

## Installation

Add ErabiKit to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/rudrankriyam/RRSettingsKit.git", from: "1.0.0")
]
```

Then import it in your SwiftUI views:

```swift
import RRSettingsKit
```

## Table of Contents

- [Quick Start](#quick-start)
- [Components](#components)
  - [SettingsNavigationRow](#settingsnavigationrow)
  - [SettingsActionRow](#settingsactionrow)
  - [SettingsRow](#settingsrow)
  - [SettingsToggleRow](#settingstogglerow)
  - [AppVersionRow](#appversionrow)
  - [WriteReviewRow](#writereviewrow)
  - [TwitterRow](#twitterrow)
  - [MailRow](#mailrow)
  - [AboutRow](#aboutrow)
- [View Modifiers](#view-modifiers)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Quick Start

Here's a simple example to get you started:

```swift
import SwiftUI
import RRSettingsKit

struct SettingsView: View {
    @State private var notificationsEnabled = true

    var body: some View {
        NavigationView {
            List {
                SettingsNavigationRow(
                    imageName: "person.circle",
                    title: "Profile",
                    destination: ProfileView()
                )

                SettingsToggleRow(
                    imageName: "bell",
                    title: "Notifications",
                    value: $notificationsEnabled
                )

                AppVersionRow(version: "1.0.0")

                AboutRow(
                    title: "Made with love by Your Name",
                    accessibilityTitle: "Made with love by Your Name"
                )
            }
            .navigationTitle("Settings")
        }
    }
}
```

## Components

### SettingsNavigationRow

A settings row with navigation capability that pushes to a destination view.

```swift
SettingsNavigationRow(
    imageName: "gear",
    title: "General",
    addOverlay: true,
    destination: GeneralSettingsView()
)
```

**Parameters:**
- `imageName`: SF Symbol name for the icon
- `title`: Text to display
- `addOverlay`: Enable/disable gradient border (default: `true`)
- `destination`: SwiftUI view to navigate to

### SettingsActionRow

A settings row that performs a custom action when tapped.

```swift
SettingsActionRow(
    imageName: "trash",
    title: "Clear Cache",
    addOverlay: true
) {
    clearCache()
}
```

**Parameters:**
- `imageName`: SF Symbol name for the icon
- `title`: Text to display
- `addOverlay`: Enable/disable gradient border (default: `true`)
- `action`: Closure to execute on tap

### SettingsRow

A basic settings row component used as a building block for other rows.

```swift
SettingsRow(
    imageName: "star",
    title: "Favorites",
    addOverlay: true,
    showDisclosure: true
)
```

**Parameters:**
- `imageName`: SF Symbol name for the icon
- `title`: Text to display
- `addOverlay`: Enable/disable gradient border (default: `true`)
- `showDisclosure`: Show/hide chevron icon (default: `true`)

### SettingsToggleRow

A settings row with a toggle switch for boolean values.

```swift
@State private var darkModeEnabled = false

SettingsToggleRow(
    imageName: "moon",
    title: "Dark Mode",
    value: $darkModeEnabled,
    addOverlay: true
)
```

**Parameters:**
- `imageName`: SF Symbol name for the icon
- `title`: Text to display
- `value`: Binding to a Boolean value
- `addOverlay`: Enable/disable gradient border (default: `true`)

### AppVersionRow

Displays the current app version with a clean, informative design.

```swift
AppVersionRow(
    imageName: "info.circle",
    title: "App version",
    version: "1.2.3",
    addOverlay: true
)
```

**Parameters:**
- `imageName`: SF Symbol name for the icon (default: `"info.circle"`)
- `title`: Text to display (default: `"App version"`)
- `version`: Version string to display
- `addOverlay`: Enable/disable gradient border (default: `true`)

### WriteReviewRow

A convenient row for directing users to write an App Store review.

```swift
WriteReviewRow(
    imageName: "pencil.and.outline",
    title: "Write a review",
    appURL: "https://apps.apple.com/app/id123456789",
    addOverlay: true
)
```

**Parameters:**
- `imageName`: SF Symbol name for the icon (default: `"pencil.and.outline"`)
- `title`: Text to display (default: `"Write a review"`)
- `appURL`: App Store URL for your app
- `addOverlay`: Enable/disable gradient border (default: `true`)

### TwitterRow

Opens Twitter (X) app or web URL for social media engagement.

```swift
TwitterRow(
    imageName: "textbox",
    title: "Follow us on Twitter",
    twitterAppURL: "twitter://user?screen_name=yourusername",
    twitterWebURL: "https://twitter.com/yourusername",
    addOverlay: true
)
```

**Parameters:**
- `imageName`: SF Symbol name for the icon (default: `"textbox"`)
- `title`: Text to display
- `twitterAppURL`: Deep link to open in Twitter app
- `twitterWebURL`: Fallback web URL
- `addOverlay`: Enable/disable gradient border (default: `true`)

### MailRow

Displays a mail composer for user feedback or support emails. Automatically handles multiple mail clients (Mail, Gmail, Outlook, Yahoo, Spark).

```swift
let mailObject = MailRowObject(
    receiver: "support@example.com",
    subject: "Feedback",
    body: "I love this app!"
)

MailRow(
    image: "envelope",
    title: "Send Feedback",
    addOverlay: true,
    object: mailObject
)
```

**Parameters:**
- `image`: SF Symbol name for the icon
- `title`: Text to display
- `addOverlay`: Enable/disable gradient border (default: `true`)
- `object`: `MailRowObject` containing email details

### AboutRow

A centered text row for displaying attribution or app information.

```swift
AboutRow(
    title: "Made with love by Rudrank Riyam",
    accessibilityTitle: "Made with love by Rudrank Riyam"
)
```

**Parameters:**
- `title`: Text to display (shown in uppercase with kerning)
- `accessibilityTitle`: Accessibility label for VoiceOver

## View Modifiers

ErabiKit includes custom view modifiers you can use on any SwiftUI view:

### `.customIconImage()`

Applies consistent styling to SF Symbol icons.

```swift
Image(systemName: "star")
    .customIconImage()
```

### `.settingsBackground(cornerRadius:innerPadding:outerBottomPadding:addOverlay:)`

Applies the signature ErabiKit background with gradient border.

```swift
Text("Custom Row")
    .settingsBackground(
        cornerRadius: 16,
        innerPadding: 8,
        outerBottomPadding: 6,
        addOverlay: true
    )
```

**Parameters:**
- `cornerRadius`: Corner radius for the overlay (default: `16`)
- `innerPadding`: Vertical padding inside the row (default: `8`)
- `outerBottomPadding`: Bottom padding outside the row (default: `6`)
- `addOverlay`: Show/hide gradient border (default: `true`)

## Customization

All components use SwiftUI's accent color for theming. Set your app's accent color to automatically customize ErabiKit:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .accentColor(.purple)
        }
    }
}
```

Or use the `tint()` modifier:

```swift
SettingsNavigationRow(...)
    .tint(.blue)
```

## Example App

Based on the popular [Gradient Game](https://apps.apple.com/app/id1479784361) settings screen design.

## Contributing

Contributions are welcome! Here's how you can help:

1. **Fork the repository** and create a feature branch
2. **Make your changes** following the existing code style
3. **Test thoroughly** on iOS 15.0+
4. **Update documentation** as needed
5. **Submit a pull request** with a clear description

## License

ErabiKit is available under the MIT license. See the LICENSE file for more info.

## Contact

Created by [Rudrank Riyam](https://x.com/rudrank)

- X/Twitter: [@rudrank](https://x.com/rudrank)
- GitHub: [@rudrankriyam](https://github.com/rudrankriyam)