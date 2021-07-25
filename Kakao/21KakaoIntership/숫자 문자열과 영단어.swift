// 출처 : 프로그래머스 2021 카카오 채용연계형 인턴십 숫자 문자열과 영단어
// https://programmers.co.kr/learn/courses/30/lessons/81301
// 풀이 : hogumachu
// 영단어로 된 숫자는 Character 2개를 조합해야 유니크해짐.
// switch 문으로 case를 나눠서 조건에 맞으면 result 에 숫자를 추가하고 해당 영단어 만큼 index 크기를 늘려줬음.
// default 에는 모든 케이스를 벗어난 경우는 숫자이므로 숫자를 더하고 index + 1


import Foundation

func solution(_ value:String) -> Int {
    let s = value.map { String ($0) }
    var result = ""
    var index = 0

    while index < s.count - 1 {
        switch s[index] + s[index + 1] {
        case "ze":
            result += "\(0)"
            index += 4
        case "on":
            result += "\(1)"
            index += 3
        case "tw":
            result += "\(2)"
            index += 3
        case "th":
            result += "\(3)"
            index += 5
        case "fo":
            result += "\(4)"
            index += 4
        case "fi":
            result += "\(5)"
            index += 4
        case "si":
            result += "\(6)"
            index += 3
        case "se":
            result += "\(7)"
            index += 5
        case "ei":
            result += "\(8)"
            index += 5
        case "ni":
            result += "\(9)"
            index += 4
        default:
            result += s[index]
            index += 1
        }
    }

    if let number = Int(s[s.count - 1]) {
        result += "\(number)"
    }

    return Int(result)!

}
