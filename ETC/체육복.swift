// 출처 : 프로그래머스 탐욕법 체육복
// https://programmers.co.kr/learn/courses/30/lessons/42862
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var reserved = reserve.sorted()
    var losted = lost.sorted()
    var count: Int = 0

    for i in 0..<reserved.count {
        for j in 0..<losted.count {
            if reserved[i] == losted[j] {
                count += 1
                reserved[i] = -1
                losted[j] = -3
            }
        }
    }
    for i in 0..<reserved.count {
        for j in 0..<losted.count {
            if reserved[i] - 1 == losted[j] {
                count += 1
                reserved[i] = -1
                losted[j] = -3

            } else if reserved[i] + 1 == losted[j] {
                count += 1
                reserved[i] = -1
                losted[j] = -3
            }
        }
    }

    return n - lost.count + count
}
