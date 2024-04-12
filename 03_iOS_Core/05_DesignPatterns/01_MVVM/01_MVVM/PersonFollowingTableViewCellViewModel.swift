
import UIKit

struct PersonFollowingTableViewCellViewModel {
    let name: String
    let userName: String
    var isFollowing: Bool
    let image: UIImage?
    
    init(with model: Person) {
        name = model.name
        userName = model.userName ?? "guest"
        isFollowing = false
        image = UIImage(systemName: "person")
    }
}
