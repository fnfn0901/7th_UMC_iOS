import UIKit

struct DummyData {
    
    static func getProducts() -> [Product] {
        return [
            Product(name: "손오공이 잃어버린 머리띠 반쪽", description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", price: "85,340원", image: UIImage(named: "product01")),
            Product(name: "골드 반지", description: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!", price: "430,000원", image: UIImage(named: "product02")),
            Product(name: "하얀 신발", description: "짝퉁 나이키 신발! 정말 푹신푹신해서 걷다가 졸려서 넘어지...", price: "72,550원", image: UIImage(named: "product03")),
            Product(name: "에베레스트 다이아 반지", description: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", price: "910,000원", image: UIImage(named: "product04")),
            Product(name: "아디다스 신발", description: "아디다스처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", price: "51,230원", image: UIImage(named: "product05")),
            Product(name: "황제 잠옷", description: "어느 나라의 황제가 입었다던 잠옷 크리스마스 트리같이 보이는 디자인!", price: "123,450원", image: UIImage(named: "product06")),
            Product(name: "고장난 기타", description: "블라블라블라블라 블라블라블라블라블라", price: "12,990원", image: UIImage(named: "product07")),
            Product(name: "하얀 음료", description: "설명 쓰는게 제일 어려워", price: "6,780원", image: UIImage(named: "product08")),
            Product(name: "네이버에서 가져온 아무 사진", description: "그냥 정해주는 게 더 좋아요", price: "950,000원", image: UIImage(named: "product09")),
            Product(name: "이것도 가져온 사진", description: "그냥 정해주는 게 더 좋아요", price: "45,670원", image: UIImage(named: "product10"))
        ]
    }
}
