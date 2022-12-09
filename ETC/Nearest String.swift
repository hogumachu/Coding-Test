// 출처 : 프로그래머스 가장 가까운 같은 글자
// https://school.programmers.co.kr/learn/courses/30/lessons/142086
// 풀이 : hogumachu

import Foundation

func solution(_ s: String) -> [Int] {
    var location: [Int] = Array(repeating: -1, count: 26)
    var result: [Int] = Array(repeating: -1, count: s.count)
    
    s.map { $0.toInt() }
    .enumerated()
    .forEach {
        if location[$0.element] != -1 {
            result[$0.offset] = $0.offset - location[$0.element]
        }
        location[$0.element] = $0.offset
    }
    return result
}

extension Character {
    
    func toInt() -> Int {
        return Int(self.asciiValue!) - 97
    }
    
}

