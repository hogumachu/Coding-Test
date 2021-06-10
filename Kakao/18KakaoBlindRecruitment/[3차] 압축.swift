// 출처 : 프로그래머스 2018 KAKAO BLIND RECRUITMENT [3차] 압축
// https://programmers.co.kr/learn/courses/30/lessons/17684
// 풀이 : hogumachu

func solution(_ msg:String) -> [Int] {
    var result: [Int] = []
    var values: [String:Int] = [:]
    var next: String = ""
    var nextCounting = 27
    for i in 1...26 {
        values["\(UnicodeScalar(i+64)!)"] = i
    }

    for m in msg {
        if values[next + "\(m)"] == nil {
            result.append(values[next]!)
            values[next+"\(m)"] = nextCounting
            nextCounting += 1
            next = "\(m)"
        } else {
            next += "\(m)"
        }
    }
    result.append(values[next]!)
    return result
}
