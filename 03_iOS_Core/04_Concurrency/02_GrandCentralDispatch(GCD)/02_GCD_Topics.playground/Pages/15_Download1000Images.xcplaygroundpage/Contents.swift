import UIKit

// URLs of the images to download
let imageUrls: [String] = [
    "https://example.com/image1.jpg",
    "https://example.com/image2.jpg",
    // Add more image URLs here...
]

// Create a concurrent dispatch queue
let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

// Create a dispatch group to track the progress of the image downloads
let group = DispatchGroup()

// Array to store downloaded images
var downloadedImages: [UIImage] = []

// Loop through image URLs and download images in parallel
for imageUrl in imageUrls {
    group.enter() // Enter the group before starting the download task
    
    // Download image asynchronously
    concurrentQueue.async {
        if let url = URL(string: imageUrl), let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
            // Append the downloaded image to the array
            downloadedImages.append(image)
        }
        
        group.leave() // Leave the group when the download task is complete
    }
}

// Notify when all image downloads are completed
group.notify(queue: .main) {
    print("All image downloads completed")
    
    // Process the downloaded images
    for (index, image) in downloadedImages.enumerated() {
        // Handle each downloaded image
        // For example, display it in a UIImageView or save it to the device
        // imageView.image = image
        // UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
