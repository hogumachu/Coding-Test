// 출처 : 프로그래머스 스택/큐 기능개발
// https://programmers.co.kr/learn/courses/30/lessons/42586
// 풀이 : hogumachu

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var days: [Int] = []
    var day: Int = 1
    var count: Int = 1
    var comparison: Int = 0
    var result: [Int] = []
    var arr = progresses

    for i in 0..<arr.count {
        while arr[i] < 100 {
            for j in i..<arr.count {
                arr[j] = progresses[j] + speeds[j] * day
            }
            day += 1
        }
        days.append(day - 1)
    }
    comparison = days[0]
    for i in 1..<days.count {
        if comparison == days[i] {
            count += 1
        } else {
            result.append(count)
            comparison = days[i]
            count = 1
        }
    }
    result.append(count)
    return result
}
