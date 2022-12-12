// 출처 : 프로그래머스 연습문제 연속 부분 수열 합의 개수
// https://programmers.co.kr/learn/courses/30/lessons/131701
// 풀이 : hogumachu

import Foundation

func solution(_ elements: [Int]) -> Int {
    let sum = elements.reduce(0, +)
    var isEnabled = Array(repeating: false, count: sum + 1)
    isEnabled[sum] = true
    
    for i in 0..<elements.count {
        var value = 0
        for j in 0..<elements.count {
            let index = i + j > elements.count - 1 ? i + j - elements.count : i + j
            value += elements[index]
            isEnabled[value] = true
        }
    }
    
    return isEnabled.filter { $0 }.count
}
