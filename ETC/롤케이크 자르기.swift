// 출처 : 프로그래머스 연습문제 롤케이크 자르기
// https://school.programmers.co.kr/learn/courses/30/lessons/132265
// 풀이 : hogumachu

import Foundation

func solution(_ topping: [Int]) -> Int {
    var left: [Int] = Array(repeating: 0, count: 10_001)
    var right: [Int] = Array(repeating: 0, count: 10_001)
    var leftCount = 0
    var rightCount = 0
    var result = 0
    
    topping.forEach {
        if right[$0] == 0 {
            rightCount += 1
        }
        right[$0] += 1
    }
    
    topping.forEach {
        if left[$0] == 0 {
            leftCount += 1
        }
        
        left[$0] += 1
        right[$0] -= 1
        
        if right[$0] == 0 {
            rightCount -= 1
        }
        
        if leftCount == rightCount {
            result += 1
        }
    }
    
    return result
}
