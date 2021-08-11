// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 숫자 게임
// https://programmers.co.kr/learn/courses/30/lessons/12987
// 풀이 : hogumachu

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let sortedA = a.sorted()
    let sortedB = b.sorted()
    var result = 0
    var index = 0

    for value in sortedB {
        if sortedA[index] < value {
            result += 1
            index += 1
        }
    }

    return result
}
