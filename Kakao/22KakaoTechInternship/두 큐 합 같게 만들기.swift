// 출처 : 프로그래머스 2022 KAKO TECH INTERNSHIP 두 큐 합 같게 만들기
// https://school.programmers.co.kr/learn/courses/30/lessons/118667
// 풀이 : hogumachu

import Foundation

func solution(_ queue1: [Int], _ queue2: [Int]) -> Int {
    let MAX_COUNT = 600_001
    var queue1 = queue1
    var queue2 = queue2
    var queue1FirstIndex = 0
    var queue2FirstIndex = 0
    var queue1Sum = queue1.reduce(0, +)
    var queue2Sum = queue2.reduce(0, +)
    var changeCount = 0
    
    if queue1Sum == queue2Sum {
        return 0
    }
    
    while queue1Sum != queue2Sum && changeCount < MAX_COUNT {
        if queue1Sum > queue2Sum {
            let value = queue1[queue1FirstIndex]
            queue2.append(value)
            queue1Sum -= value
            queue2Sum += value
            queue1FirstIndex += 1
        } else {
            let value = queue2[queue2FirstIndex]
            queue1.append(value)
            queue1Sum += value
            queue2Sum -= value
            queue2FirstIndex += 1
        }
        changeCount += 1
    }
    
    return changeCount == MAX_COUNT ? -1 : changeCount
}
