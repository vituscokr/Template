
참고: https://www.hackingwithswift.com/books/ios-swiftui/one-to-many-relationships-with-core-data-swiftui-and-fetchrequest


Make sure you run that code, because it works really well – all our candy bars are automatically sorted into sections when the Add button is tapped. Even better, because we did all the heavy lifting inside our NSManagedObject subclasses, the resulting SwiftUI code is actually remarkably straightforward – it has no idea that an NSSet is behind the scenes, and is much easier to understand as a result.

Tip: If you don’t see your candy bars sorted into sections after pressing Add, make sure you haven’t removed the mergePolicy change from the DataController class. As a reminder, it should set to NSMergePolicy.mergeByPropertyObjectTrump.


https://betterprogramming.pub/swiftui-and-coredata-the-mvvm-way-ab9847cbff0f

https://www.hackingwithswift.com/books/ios-swiftui/ensuring-core-data-objects-are-unique-using-constraints

