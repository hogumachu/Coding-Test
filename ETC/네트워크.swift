// 출처 : 프로그래머스 깊이/너비 우선 탐색(DFS/BFS) 네트워크
// https://programmers.co.kr/learn/courses/30/lessons/43162
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var notVisit: [Bool] = Array(repeating: true, count: n+1)
    var result = 0

    func visit(_ x: Int) -> Void {
        for i in 0..<n {
            if computers[x][i] == 1 && notVisit[i] {
                notVisit[i] = false
                visit(i)
            }
        }
    }

    for i in 0..<n {
        for j in i..<n {
            if computers[i][j] == 1 && notVisit[j] {
                if i == j {
                    result += 1
                    notVisit[j] = false
                } else {
                    notVisit[j] = false
                    visit(j)
                }
            }
        }
    }
    return result
}
