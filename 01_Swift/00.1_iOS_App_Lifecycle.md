
/**

Not Running: the app is considered to be in a Not Running state when it is not yet launched or terminated by the system or user.

Foreground:

    Inactive: the app is in an inactive state when it is in the foreground but not receiving events. 
              In other words, we can say that it acts like a bridge state in which the app remains briefly when it transitions to a different state.

    Active: it is a normal mode for the app when it is in the foreground state and receiving all the user events.

Background: the app transitions into the background state when the user taps on the home screen while using the application, 
            or it requires some extra execution time. 
            When the app is about to be suspended, then also transitions into this state for a small amount of time. 
            In this state, the app remains in the background and executes the code.

Suspended: in this state, the app remains in the background and doesn't execute the code. 
           The app is automatically moved to this state. In this state, the app remains in memory. 
           However, the foreground apps are always given priority over suspended apps and can be purged any time without notice.
*/