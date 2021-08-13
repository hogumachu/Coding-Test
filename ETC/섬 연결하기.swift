// 출처 : 프로그래머스 탐욕법(Greedy) 섬 연결하기
// https://programmers.co.kr/learn/courses/30/lessons/42861
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: n)
    var sortedCosts: [(Int, Int, Int)] = []
    var parent: [Int] = []
    var result = 0
    var counting = n - 1
    for cost in costs {
        sortedCosts.append((cost[0], cost[1], cost[2]))
    }

    for i in 0..<n {
        parent.append(i)
    }

    sortedCosts.sort(by: { $0.2 < $1.2 })

    func getParent(_ a: Int) -> Int {
        if parent[a] == a {
            return a
        } else {
            parent[a] = getParent(parent[a])
            return parent[a]
        }
    }

    func unionParent(_ a: Int, _ b: Int) {
        let aParent = getParent(a)
        let bParent = getParent(b)
        if aParent < bParent {
            parent[b] = aParent
            for i in 0..<n {
                if parent[i] == bParent {
                    parent[i] = aParent
                }
            }
        } else {
            parent[a] = bParent
            for i in 0..<n {
                if parent[i] == aParent {
                    parent[i] = bParent
                }
            }
        }
    }

    for cost in sortedCosts {
        if getParent(cost.0) != getParent(cost.1) {
            result += cost.2
            counting -= 1
            unionParent(cost.0, cost.1)
        }

        if counting == 0 {
            break
        }
    }
    return result
}
