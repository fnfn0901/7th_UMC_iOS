import UIKit

class Product {
    let name: String
    let description: String
    let price: String
    let image: UIImage?
    
    init(name: String, description: String, price: String, image: UIImage?) {
        self.name = name
        self.description = description
        self.price = price
        self.image = image
    }
}
