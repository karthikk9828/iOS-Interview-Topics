
## Different ways of managing state using property wrappers.

### `@State`
    
Used for storing a state inside a view, if the state changes, the view will be redrawn. 

The State object will persist when the view is gets destroyed and reinitialized everytime.

### `@Binding`
    
Used for passing the state down to the child view, 
if the child view updates the passed binding object, it will be updated in the parent as well.

If the child view does not update the property, only reads it, then use `@State`

### `@StateObject`

Used for state (ex: view models) when they are being initialized.

### `@ObservedObject`

Used for state (ex: view models) when they are being injected into the class.

### `@ObservableObject`

Is a protocol that objects conform to, they can publish values.

### `@EnvironmentObject`

View model (ObservedObject/StateObject) is tightly coupled to a single view. EnvironmentObject is not attached to a single view, multiple views can access it. 

EnvironmentObject is injected using a modifier `.environment(object)`. All the subviews of this view can access this injected object.

### `@Observable`

Introduced in `iOS 17`. It is more cleaner and efficient way of passing data around in SwiftUI. No need to annotate the instance with `@StateObject` or `@ObservedObject`. There is no confusion about when to use which one.

### `@AppStorage`

Used for interacting with UserDefaults in SwiftUI. Watch the value and triggers the UI update automatically when the value changes.

## What happens when we add a view modifier?

Everytime we add a modifier to a view, we are wrapping the view in a new view. Because of this the order of the modifiers matters

## `@ViewBuilder`

It is the last parameter of every view, ex: VStack { }
whatever is passed in the closure is annotated with @ViewBuilder.

Inside `@ViewBuilder`, only some of the swift code works, ex: if else, switch etc.

## `AsyncImage`

Used for loading image from URL. It does not cache the image. If caching is important, create a view with custom cachiung logic.