# VMSignatureView
A custom view to capture signature from user

##Usage
Add a new `UIView` where you want the capture signature. Set its class to `VMSignatureView` from storyboard and create an `@IBOutlet` property for it in your `UIViewController`

#### Methods

* `clear()`

This clears the view

* `getSignature(scale:CGFloat = 1) -> UIImage?`

This returns the signature with scale factor. Default scale factor is 1

#### Properties

* `strokeWidth: CGFloat`

Sets the width of the signature stroke

* `strokeColor: UIColor`

Sets the UIColor of the signature stroke

* `hasSignature: Bool`

This is a computed read-only property which returns `true` or `true` if the view contains a signature or not

* `delegate: VMSignatureDelegate?`

Sets the delegate for the view

#### Optional Protocol Methods

* `startedDrawing()`

Notifies the delegate when user starts a stroke in the view

* `finishedDrawing()`

Notifies the delegate when user finishes a stroke in the view
