// 카운트를 담당하는 변수
struct CountUpDownModel {
    // 카운트를 담당하는 변수
    var count: Int = 0

    // 카운트를 증가, 감소시키는 함수
    mutating func increaseCount() {
        self.count += 1
    }
    
    mutating func decreaseCount() {
        self.count -= 1
    }
}
