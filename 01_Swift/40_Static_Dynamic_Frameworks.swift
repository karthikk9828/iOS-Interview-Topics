
/**
    There are two types of frameworks on iOS: static and dynamic.

    Static frameworks are pre-compiled libraries that are linked to your app during the build process. 
    This means that the framework code is included in the final app binary and cannot be updated or changed at runtime.

    Dynamic frameworks, on the other hand, are compiled libraries that are loaded at runtime. 
    This means that the framework code is not included in the app binary and can be updated or changed at runtime.

    Static Framework:

        A static framework is a library that contains compiled code (usually in the form of object files) linked directly into the binary of your application at build time.
        When you use a static framework, the code is copied and embedded into your application's binary executable.
        Static frameworks increase the size of your application's binary, as all the code from the framework is included in the final executable.
        Static frameworks are suitable for cases where you want to ensure that the library's code is always included with your application and that there are no external dependencies.
        Static frameworks are less flexible in terms of updates, as you need to rebuild and redistribute your application every time the framework is updated.

    Dynamic Framework:

        A dynamic framework is a library that contains compiled code packaged as a separate binary file (typically a .framework directory) that is linked dynamically with your application at runtime.
        Dynamic frameworks are linked to your application's binary as separate libraries, and they are loaded into memory only when needed.
        Dynamic frameworks reduce the size of your application's binary, as the framework's code is stored in a separate file and only loaded into memory when required.
        Dynamic frameworks allow for easier updates, as you can update the framework separately from your application and distribute updates without rebuilding your application.
        Dynamic frameworks are suitable for cases where you want to share code across multiple applications or distribute updates independently from your application.

In summary, the choice between static and dynamic frameworks depends on factors such as the size of your application, 
the need for flexibility in updates, and the level of code reuse across multiple applications. 
Both static and dynamic frameworks have their advantages and disadvantages, 
and the choice depends on your specific requirements and preferences.
*/
