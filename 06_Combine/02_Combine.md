# Combine
 - A framework for reactive programming and data binding
 - Introduced by Apple in WWDC 2019

## Key concepts in Combine
- Publishers
- Subscribers
- Operators
- Subjects

------------------------------------------------------
------------------------------------------------------

# Publishers
- a source of data that emits items over time
- initiates data streams
- emits data to Subscribers
- ex: user input, sensor data, API response

------------------------------------------------------
------------------------------------------------------

# Subscribers
- receives and reacts to the data emitted by publishers
- listens to data streams
- processes and responds to emitted items
- ex: UI components, data processors

------------------------------------------------------
------------------------------------------------------

# Operators
- Functions to transform and manipulate data
- ex: map, filter, merge

------------------------------------------------------
------------------------------------------------------

# Subjects 
- is a special type of Publisher that is also a Subscriber
- acts as a bridge between Publishers and Subscribers
- can multicast data to multiple subscribers

------------------------------------------------------
------------------------------------------------------

## Benefits of using Combine
- Improved code readability
- Enhanced error handling
- Better support for asynchronous operations
- Built-in support for SwiftUI