# View Controller Lifecycle

In iOS development with Swift, a `UIViewController` has a well-defined lifecycle that includes various methods called at different stages. Understanding the view controller lifecycle is crucial for implementing features at the right moments and managing resources effectively. Here's an overview of the key lifecycle methods:

1. **`init(coder:)` and `init(nibName:bundle:)`:**
   - Initialization methods called when the view controller is created, either from a storyboard or programmatically.
   - Usually used for setting up initial properties.

2. **`loadView`:**
   - Called when the view controller's view property is accessed and its value is currently `nil`.
   - Responsible for creating the view hierarchy programmatically if not using a storyboard.

3. **`viewDidLoad`:**
   - Called after the view has been loaded into memory.
   - A good place to perform one-time setup, such as initializing UI components or loading data.
   - The view is not necessarily visible at this point.

4. **`viewWillAppear(_:)` and `viewDidAppear(_:)`:**
   - Called just before and after the view is added to the view hierarchy and becomes visible on the screen.
   - Good for tasks like updating UI based on data changes, starting animations, or requesting data from a server.

5. **`viewWillDisappear(_:)` and `viewDidDisappear(_:)`:**
   - Called just before and after the view is removed from the view hierarchy and is no longer visible.
   - Useful for tasks like saving user data, stopping animations, or releasing resources.

6. **`viewWillLayoutSubviews` and `viewDidLayoutSubviews`:**
   - Called just before and after the view controller's view lays out its subviews.
   - Useful for adjusting the layout of subviews or performing additional layout-related tasks.

7. **`didReceiveMemoryWarning`:**
   - Called when the system is low on memory.
   - Provides an opportunity to release non-essential resources to free up memory.
   
8. **`viewWillTransition(to:with:)`:**
   - Called when the interface orientation of the view controller's view is about to change.
   - Useful for adjusting the layout based on the new orientation.

9. **`deinit`:**
   - Called when the view controller is about to be deallocated.
   - Useful for cleaning up any remaining resources.

Understanding and utilizing these lifecycle methods appropriately allows you to manage the state and behavior of your view controller at different points in its lifecycle. It's essential to balance resource management and performance optimization throughout the lifecycle to create a smooth and responsive user experience.
