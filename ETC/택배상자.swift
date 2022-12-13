// 출처 : 프로그래머스 연습문제 택배상자
// https://school.programmers.co.kr/learn/courses/30/lessons/131704
// 풀이 : hogumachu

import Foundation

func solution(_ order: [Int]) -> Int {
    var visited: [Int] = (0...1_000_000).map { $0 }
    var currentVisited = order[0]
    var result = 0

    visited[currentVisited] = visited[currentVisited - 1]
    result += 1

    func leftValue(_ index: Int) -> Int {
        if visited[index] == index {
            return index
        } else {
            visited[index] = leftValue(visited[index])
            return visited[index]
        }
    }
    
    for i in 1..<order.count {
        if order[i] <= currentVisited && order[i] != leftValue(currentVisited - 1) {
            return result
        }
        currentVisited = order[i]
        visited[currentVisited] = visited[currentVisited - 1]
        result += 1
    }
    
    return result
}
