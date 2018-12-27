# Jumprock

[![CI Status](https://img.shields.io/travis/imryan/Jumprock.svg?style=flat)](https://travis-ci.org/imryan/Jumprock)
[![Version](https://img.shields.io/cocoapods/v/Jumprock.svg?style=flat)](https://cocoapods.org/pods/Jumprock)
[![License](https://img.shields.io/cocoapods/l/Jumprock.svg?style=flat)](https://cocoapods.org/pods/Jumprock)
[![Platform](https://img.shields.io/cocoapods/p/Jumprock.svg?style=flat)](https://cocoapods.org/pods/Jumprock)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

### Create form
```swift
let form = JumprockForm(subject: "Hello, world!", message: "Some message.",
                          phone: "2125551234", name: "John Doe",
                 replyToAddress: "notryancohen@gmail.com",
              redirectURLString: nil, cc: ["ryan@hellowynd.com", "notryancohen666@gmail.com"], bcc: nil)
```
### Send form
```swift
Jumprock.send(form, fromAlias: "ALIAS") { (error) in
    if let error = error {
        debugPrint("Did not send email:", error)
    }
    else {
      debugPrint("Sent email!")
   }
}
```
## Installation

Jumprock is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Jumprock'
```

## Author

Ryan Cohen, notryancohen@gmail.com

## License

Jumprock is available under the MIT license. See the LICENSE file for more info.
