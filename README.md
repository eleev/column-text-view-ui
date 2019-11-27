# column-text-view-ui [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)

[![Platform](https://img.shields.io/badge/platform-iOS_12-yellow.svg)]()
[![Platform](https://img.shields.io/badge/platform-iPadOS_12-darkyellow.svg)]()
[![Language](https://img.shields.io/badge/language-Swift_5.1-orange.svg)]()
[![SPM](https://img.shields.io/badge/SPM-Supported-red.svg)]()
[![License](https://img.shields.io/badge/license-MIT-blue.svg)]()

**Last Update: 27/November/2019.**

![](cover-preview.png)

### If you like the project, please give it a star ⭐ It will show the creator your appreciation and help others to discover the repo.

# ✍️ About
📄 Column Text View is an adaptive UI component that renders text in columns, horizontally [iOS 12, UIKit, TextKit, SwiftUI].

# 📺 Demo
Please wait while the `.gif` files are loading...

# 🍱 Features
- **Configurable**
    - There are a number of configurable properties and you can use, such as, you can specify the number of columns for the supplied text, specify column spacing, paddings and other properties
- **Adaptive**
    - The underlying text container adjusts its size to support the needed amount of space for the supplied text
-  **SwiftUI Compatable**
    - You can use a dedicated wrapper called `ColumnedTextView` to use the componet with `SwiftUI`   
- **Ease of Use**
    - Instantiate a single instane of `ColumnTextView` or `ColumnedTextView` (for `SwiftUI` ), setup the parent view and supply some text
- **Designable and Inspectable**
    - You can use `.storyboard` or `.xib` files to configure the component without touching code (well, almost)

# 📚 Usage

The first thing you need to do is to prepare the UI component. The following example demostrates the programmatic approach, where the component is instantiated without `.storyboard` or `.xib` outlets:

```swift
// 1
let columnTextView = ColumnTextView(frame: view.bounds)
columnTextView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
columnTextView.backgroundColor = .white
parentView.addSubview(columnTextView)

// 2
columnTextView.attributedText = attributedString
// 3
columnTextView.columns = .columns(2)
```
- (1) The first part is instantiation and setup. Here we have pretty usual things happenning, nothing exotic 🌴.
- (2) The next part is about the text `attachment`. You simply create an instance of `NSAttributedString`, configure it as you'd like and that's it. 
- (3) You can specify the way the columns should be created. Here you have two options: to use `.absolute(***UInt16***)`, where the associated parameter is a single column `width` in points or to use `.columns(***UInt16***)`, where the associated parameter is a positive integer number that specifies the exact number of columns that should be created for the current screen's `width`.

You can change the `attributedText` property, the results will be correspondigly reflected and specify all `four` paddings for `top, right, bottom and left` sides of the component. 

# 🏗 Installation

## Swift Package Manager

### Xcode 11+

1. Open `MenuBar` → `File` → `Swift Packages` → `Add Package Dependency...`
2. Paste the package repository url `https://github.com/jVirus/column-text-view-ui` and hit `Next`.
3. Select the installment rules.

After specifying which version do you want to install, the package will be downloaded and attached to your project. 

### Package.swift
If you already have a `Package.swift` or you are building your own package simply add a new dependency:

```swift
dependencies: [
    .package(url: "`https://github.com/jVirus/column-text-view-ui", from: "1.0.0")
]
```

## Manual 
You can always use copy-paste the sources method 😄. Or you can compile the framework and include it with your project.

# 🙋‍♀️🙋‍♂️ Contributing
Your contributions are always appreciated. There are many ways how you help with the project:

- You can suggest something
- You can write additional documentation or sample codes
- Implement a new feature 
- Fix a bug
- Help to maintain by answering to the questions (if any) that other folks have
- etc.

Overall guidelies are:

- Please, discuss a feature or a major source change/addition before spending time and creating a pool requested via issues. 
- Create a separate branch and make sure that your code compiles and does not produce errors and warnings.
- Please, don't be upset if it takes a while to review your code or receive an answer.

# 👨‍💻 Author 
[Astemir Eleev](https://github.com/jVirus)

# 🔖 Licence 
The project is available under [MIT Licence](https://github.com/jVirus/column-text-view-ui/blob/master/LICENSE)
