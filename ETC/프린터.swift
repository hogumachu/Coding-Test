// 출처 : 프로그래머스 스택/큐 프린터
// https://programmers.co.kr/learn/courses/30/lessons/42587
// 풀이 : hogumachu

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var count: Int = 0
    var i: Int = 0
    var arr = priorities.sorted(by: >)
    var result = Array(repeating: 0, count: priorities.count)

    while true {
        if count == arr.count {
            break
        }
        if i == priorities.count {
            i = 0
        }
        if arr[count] == priorities[i] {
            result[i] = count + 1
            count += 1
        }
        i += 1

    }
    return result[location]

}
