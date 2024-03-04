
import Foundation

/**
    Delegates are used to achieve One-to-One communication pattern.
    It allows one view to communicate with another view.
*/

enum Product {
    case iPhone, iPad, MacBook
}

protocol ProductSelectionDelegate {
    func didSelectProduct(_ product: Product)
}

class MainViewController: ProductSelectionDelegate {

    func selectProduct(_ product: Product) {
        let productSelectionVC = ProductSelectionViewController() 
        productSelectionVC.delegate = self
        productSelectionVC.didSelectProduct(product)
    }

    func didSelectProduct(_ product: Product) {
        print("Selected: \(product)")
    }
}

class ProductSelectionViewController {

    var delegate: ProductSelectionDelegate?

    func didSelectProduct(_ product: Product) {
        delegate?.didSelectProduct(product)
    }
}

let mainVC = MainViewController() 
mainVC.selectProduct(.iPhone)