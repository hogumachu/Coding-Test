// 출처 : 프로그래머스 2019 카카오 개발자 겨울 인턴십 튜플
// https://programmers.co.kr/learn/courses/30/lessons/64065
// 풀이 : hogumachu

import Foundation

func solution(_ str:String) -> [Int] {
    let s = str.split(separator: "}")
    var values: [[Int]] = Array(repeating: [], count: s.count)
    var result: [Int] = []

    for i in 0..<s.count {
        let value = s[i].filter {
            if $0 == "{" {
                return false
            }
            return true
        }
        .split(separator: ",")
        .map { Int(String($0))! }
        values[i] = value
    }
    values.sort(by: {
        $0.count < $1.count
    })

    for i in 0..<values.count {
        values[i].forEach {
            if !result.contains($0) {
                result.append($0)
            }
        }
    }

    return result
}
