
import UIKit

struct GitHubUser: Codable {
    let avatar_url: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async { [weak self] in
            self?.getUserImages()
        }
    }
    
    private let imageCache = NSCache<NSString, UIImage>()

    func loadImage(_ url: String, _ completion: @escaping (Bool) -> ()) {
        URLSession.shared.dataTask(with: URL(string: url)!) {[weak self] data, response, error in
            guard let self = self else { return }
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                let image = UIImage(data: data!)
                self.imageCache.setObject(image!, forKey: url as NSString)
                completion(true)
            } else {
                completion(false)
            }
        }
    }

    func getUserImages() {
        let url = URL(string: "https://api.github.com/users")!
        
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let self = self else { return }
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                let group = DispatchGroup()
                                
                let userResponse = try? JSONDecoder().decode([GitHubUser].self, from: data!)
                
                let images = [
                    userResponse![0].avatar_url,
                    userResponse![1].avatar_url,
                    userResponse![2].avatar_url
                ]
                
                images.forEach { imageUrl in
                    group.enter()
                    self.loadImage(imageUrl) { isCached in
                        print("Image caching \(isCached ? "successful": "failed")")
                        group.leave()
                    }
                }
                
                group.notify(queue: .main) {
                    print("Work done: \(Thread.current)")
                }
            }
        }.resume()
        
        // avoid wait since it blocks the execution of calling thread, use notify() instead
        //group.wait()
        //print("Work done: \(Thread.current)")
    }

}

