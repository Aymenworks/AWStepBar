# AWStepBar
 
AWStepBar is a UI Component that allows you to integrate a step progress UI within your app.

## Overview

### Appareance

![Step Bar gif](./AWStepBar.gif)

###  Behind the scenes

As simple as:
![Whimsical AWStepBar](./AWStepBarWhimsical.png)

## 🔶 Requirements

- iOS 9.0+
- Swift 5.0

## 👨🏻‍💻 Usage

```swift
let stepBar = AWStepBar()
stepBar.dataSource = self
stepBar.stepBarForegroundColor = .green
stepBar.stepBarBackgroundColor = .lightGray
stepBar.dotColor = .gray
stepBar.dotSelectedColor = .white
stepBar.set(step: 1, animated: false)
```

DataSource
```swift
public protocol AWStepBarDataSource: class {
    func numberOfSteps(in stepBar: AWStepBar) -> Int
}
```

## Installation

### CocoaPods

```pod 'AWStepBar'```

### Carthage

```github "Aymenworks/AWStepBar"```


## License

AWStepBar is released under the MIT license.
