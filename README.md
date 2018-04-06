# GyozaKit 🥟

![GyozaKit Demo](https://rawgit.com/john-crossley/GyozaKit/master/Assets/GyozaKit.gif)

## Installation

## Usage

When building a Gyoza the most basic example is the one shown below. The only property you need to set on the builder is a message.

### Basic Example

```swift
import GyozaKit

let gyoza = Gyoza { builder in
    builder.message = "Don't forget to wash the dishes!"
}

gyoza.show(on: self.view)

```

Once we're happy with our `Gyoza` we can call `show(on: self.view)` which will then present the message onto the current view.

### Custom Example

```swift
import GyozaKit

let gyoza = Gyoza { builder in
    builder.message = "Jaded zombies acted quaintly but kept driving their oxen forward."
    builder.messageColor = .white
    builder.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)

    builder.actionLabelColor = UIColor(red: 0.16, green: 0.90, blue: 0.40, alpha: 1.00)
    builder.action = Gyoza.Action(title: "ACTION", handler: {
        # ...
    })
}

gyoza.show(on: self.view)
```

## Author
- [John Crossley](https://github.com/john-crossley)
- [James Ruston](http://github.com/jamesruston)

## License

GyozaKit is available under the MIT license. See the LICENSE file for more info.
