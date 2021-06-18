// 출처 : 프로그래머스 탐욕법(Greedy) 조이스틱
// https://programmers.co.kr/learn/courses/30/lessons/42860
// 풀이 : hogumachu

import Foundation

func solution(_ name:String) -> Int {
    var result = 0
    var values: [Int] = []
    var isZero: [Bool] = []
    for c in name {
        let ascii = Int(c.asciiValue!)
        let next = min(abs(65 - ascii), abs(1+90 - ascii))
        values.append(next)
        if next == 0 {
            isZero.append(true)
        } else {
            isZero.append(false)
        }
    }
    if !values.contains(0) {
        return values.reduce(values.count - 1,+)
    } else {
        var results: [Int] = []
        var now = 0
        for i in 0..<values.count {
            if !isZero[i..<values.count].contains(false) {
                break
            }
            now += values[i]
            if i != 0 {
                now += 1
            }
            if i + 1 < values.count {
                if isZero[i+1..<values.count].contains(false) {
                    var nextNow = now + i
                    for j in i+1..<values.count {
                        if isZero[i+1..<values.count + i+1 - j].contains(false) {
                            nextNow += values[values.count + i - j]
                            nextNow += 1
                        } else {
                            break
                        }
                    }
                    results.append(nextNow)
                }

            }
        }
        results.append(now)
        return results.min()!
    }
    return result
}
