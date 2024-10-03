import UIKit

class SavedViewController: UIViewController {
    
    private let savedView = SavedView()
    private var products: [Product] = []  // Product 데이터 배열

    override func loadView() {
        self.view = savedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        createDummyData()
    }

    // 테이블 뷰 설정
    private func setupTableView() {
        savedView.tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        savedView.tableView.dataSource = self
        savedView.tableView.delegate = self
    }

    // 더미 데이터 생성
    private func createDummyData() {
        products = DummyData.getProducts()  // DummyData에서 더미 데이터를 가져옴
        savedView.tableView.reloadData()
        
        // 더미 데이터 개수에 맞춰 "전체 N개"로 라벨 업데이트
        savedView.countLabel.text = "전체 \(products.count)개"
    }
}

// Extension으로 UITableViewDataSource 및 UITableViewDelegate 메서드 구현
extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        cell.productTitleLabel.text = product.name
        cell.productDescriptionLabel.text = product.description
        cell.priceLabel.text = product.price
        cell.productImageView.image = product.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 99  // 셀 높이 고정
    }
}
