# VMSignatureView
A custom view to capture signature from user.

## Usage

* Add `VMSignatureView` class to your project

* Add a new `UIView` where you want the capture signature. Set its class to `VMSignatureView` from storyboard and create an `@IBOutlet` property for it in your `UIViewController`

#### Methods

* `clear()`

This clears the view

* `getSignature(scale:CGFloat = 0) -> UIImage?`

This returns the signature with scale factor to apply to the bitmap. If you specify a value of 0.0, the scale factor is set to the scale factor of the device’s main screen.

#### Properties

* `strokeWidth: CGFloat`

Sets the width of the signature stroke

* `strokeColor: UIColor`

Sets the UIColor of the signature stroke

* `hasSignature: Bool`

Returns `true` or `false` depending on whether the view contains a signature or not

* `delegate: VMSignatureDelegate?`

Sets the delegate for the view

#### Protocol Methods

* `startedDrawing()`

Notifies the delegate when user starts a stroke in the view

* `finishedDrawing()`

Notifies the delegate when user finishes a stroke in the view

#### MIT License

Copyright (c) 2017 Vaibhav

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

