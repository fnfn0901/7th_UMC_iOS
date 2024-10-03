import Foundation

struct User {
    var id: String
    var pwd: String
    
    // UserDefaults에 유저 정보 저장
    func saveToUserDefaults() {
        UserDefaults.standard.set(id, forKey: "userId")
        UserDefaults.standard.set(pwd, forKey: "userPwd")
    }

    // UserDefaults에서 유저 정보 로드
    static func loadFromUserDefaults() -> User? {
        if let id = UserDefaults.standard.string(forKey: "userId"),
           let pwd = UserDefaults.standard.string(forKey: "userPwd") {
            return User(id: id, pwd: pwd)
        }
        return nil
    }
}
