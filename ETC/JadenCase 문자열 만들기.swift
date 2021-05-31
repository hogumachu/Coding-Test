// 출처 : 프로그래머스 연습문제 JadenCase 문자열 만들기
// https://programmers.co.kr/learn/courses/30/lessons/12951
// 풀이 : hogumachu

func solution(_ s:String) -> String {
    var values = s.map{String($0)}
    var result = ""
    var capital = true

    for c in values {
        if c == " " {
            capital = true
            result += " "
        } else {
            if capital {
                if Character(c).asciiValue! >= 97 &&  Character(c).asciiValue! <= 122 {
                    result += "\(UnicodeScalar(Character(c).asciiValue! - 32))"
                } else {
                    result += "\(c)"
                }
                capital = false
            } else {
                if Character(c).asciiValue! >= 65 &&  Character(c).asciiValue! <= 90 {
                    result += "\(UnicodeScalar(Character(c).asciiValue! + 32))"
                } else {
                    result += "\(c)"
                }
            }
        }
    }
    return result
}
