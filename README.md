# ScrollStackView
 Custom UIKit View Controller which enables stacking (vertically) any kind of subview easily while supporting scrolling behavior.

This component allows you to implement scrollable view controllers in a fast, flexible fashion by composing your current UIKit views as well as child UIViewControllers or SwiftUI components.

Here’s some examples of what you can obtain with this:

<p align="center"><img src="https://github.com/VladIacobIonut/ScrollStackView/blob/main/Assets/scroll_1.gif" height="612" width="275"/></p>

And here’s the code required to compose this scrollable screen.

```swift
stack {
            UIHostingController(rootView: AppStoreHeader())
                .height(max: 400)
            detailsLabel
                .padding(top: 30)
            shareButton
        }
```

