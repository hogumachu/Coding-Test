// 출처 : 프로그래머스 그래프 가장 먼 노드
// https://programmers.co.kr/learn/courses/30/lessons/49189
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var table: [[Int]] = Array(repeating: [], count: n+1)
    var queue: [(Int, Int)] = []
    var result: [Int] = Array(repeating: n+1, count: n+1)
    var notVisit: [Bool] = Array(repeating: true, count: n+1)
    var queueIndex = 0
    notVisit[1] = true
    for i in edge {
        if i[0] == 1 {
            result[i[1]] = 1
            queue.append((i[1], 1))
        } else if i[1] == 1 {
            result[i[0]] = 1
            queue.append((i[0], 1))
        }
        table[i[0]].append(i[1])
        table[i[1]].append(i[0])
    }

    func visit(_ x: Int, _ sum: Int) -> Void {
        for i in table[x] {
            if notVisit[i] {
                if result[i] > sum + 1 {
                    result[i] = sum+1
                    queue.append((i, sum+1))
                }
            }
        }
    }


    while queue.count > queueIndex {
        let select = queue[queueIndex]
        queueIndex += 1
        if notVisit[select.0] {
            notVisit[select.0] = false
            visit(select.0, select.1)
        }
    }
    var maxNum = 0
    var maxCount = 0
    for i in 2...n {
        if result[i] != n+1 {
            if result[i] > maxNum {
                maxNum = result[i]
                maxCount = 1
            } else if result[i] == maxNum {
                maxCount += 1
            }
        }
    }
    return maxCount
}
