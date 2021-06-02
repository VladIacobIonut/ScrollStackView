# ScrollStackView
 Custom UIKit View Controller which enables stacking (vertically) any kind of subview easily while supporting scrolling behavior.

This component allows you to implement scrollable view controllers in a fast, flexible fashion by composing your current UIKit views as well as child UIViewControllers or SwiftUI components.

Here’s some examples of what you can obtain using this component:

<img align="center" src="https://github.com/VladIacobIonut/ScrollStackView/blob/main/Assets/scroll_1.gif"/>

And here’s all the code required to compose this scrollable screen. 

```swift
stack {
    UIHostingController(rootView: AppStoreHeader())
        .height(max: 400)
    detailsLabel
        .padding(top: 30)
    shareButton
}
```

Of course there might be scenarios in which one view (in this case the ```detailsLabel```) might not need to take so much size and fit the screen, in which case we would end up with our ```shareButton```  immediately next to the text. This is correct and consistent with respect to how to stack view should behave, however we might want to keep ```shareButton``` pinned to the bottom in case the other components don't fill the screen. This can be achieved using a ```UISpacer()``` . This approach is common to SwiftUI and it somehow behaves just like SwiftUI's ```Spacer()``` modifier in that it pushes all content below it to the edge of the screen, despite not having the same customization modifiers like priority.

<img align="left" src="https://github.com/VladIacobIonut/ScrollStackView/blob/main/Assets/woutspacer.png"/>

<img align="right" src="https://github.com/VladIacobIonut/ScrollStackView/blob/main/Assets/wspacer.png"/>

