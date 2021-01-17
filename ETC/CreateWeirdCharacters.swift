// 출처 : 프로그래머스 연습문제 문자열 이상한 문자 만들기
// https://programmers.co.kr/learn/courses/30/lessons/12930
// 풀이 : hogumachu

func solution(_ s:String) -> String {
    var result: String = ""
    var index: Int = 0

    for i in 0..<s.count {
        if String(s[s.index(s.startIndex, offsetBy: i)]) == " " {
            index = 0
            result += String(s[s.index(s.startIndex, offsetBy: i)])
        } else if index%2 == 0 {
            result += String(s[s.index(s.startIndex, offsetBy: i)]).capitalized
            index += 1
        } else {
            result += String(s[s.index(s.startIndex, offsetBy: i)]).lowercased()
            index += 1
        }
    }
    return result
}
