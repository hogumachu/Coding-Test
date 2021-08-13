// 출처 : 프로그래머스 월간 코드 챌린지 시즌1 스타 수열
// https://programmers.co.kr/learn/courses/30/lessons/70130
// 풀이 : hogumachu

import Foundation

func solution(_ a:[Int]) -> Int {
    var dict: [Int: Int] = [:]
    var result = 0

    for i in a {
        if dict[i] != nil {
            dict[i]! += 1
        } else {
            dict[i] = 1
        }
    }

    for d in dict.sorted { $0.value > $1.value } {
        if result >= d.value * 2 {
            break
        }
        let compareKey = d.key
        var keyCount = 0
        var notKeyCount = 0

        for i in a {
            if i == compareKey {
                if abs(keyCount + 1 - notKeyCount) <= 1 {
                    keyCount += 1
                }
            } else {
                if abs(keyCount - notKeyCount - 1) <= 1 {
                    notKeyCount += 1
                }
            }
        }

        result = max(min(keyCount, notKeyCount) * 2, result)

        if result == d.value {
            return result
        }
    }

    return result
}
