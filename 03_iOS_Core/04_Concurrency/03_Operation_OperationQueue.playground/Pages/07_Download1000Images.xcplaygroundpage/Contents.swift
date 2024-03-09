import UIKit

// URLs of the images to download
let imageURLs: [URL] = [] /* array of 1000 image URLs */

// Create an operation queue
let downloadQueue = OperationQueue()
downloadQueue.maxConcurrentOperationCount = 10 // Set the maximum concurrent operations

// Array to store downloaded images
var downloadedImages: [UIImage] = []

// Create download operations
for url in imageURLs {
    let downloadOperation = BlockOperation {
        if let imageData = try? Data(contentsOf: url),
           let image = UIImage(data: imageData) {
            downloadedImages.append(image)
        }
    }
    downloadQueue.addOperation(downloadOperation)
}

// Add completion block
downloadQueue.addOperation {
    // Handle downloaded images
    print("All images downloaded: \(downloadedImages.count)")
}

