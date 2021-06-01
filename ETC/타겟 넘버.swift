// 출처 : 프로그래머스 타겟 넘버
// https://programmers.co.kr/learn/courses/30/lessons/43165
// 풀이 : hogumachu

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    func visit(_ array: [Int], _ sum: Int) -> Void {
        if array.isEmpty {
            if sum == target {
                result += 1
                return
            }
        } else {
            var newArray = array
            let next = newArray.removeLast()
            visit(newArray, sum+next)
            visit(newArray, sum-next)
        }
    }
    var firstArray = numbers
    let firstNext = firstArray.removeLast()
    visit(firstArray, firstNext)
    visit(firstArray, -firstNext)
    return result
}
