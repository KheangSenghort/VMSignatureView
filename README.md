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
