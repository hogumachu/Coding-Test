// 출처 : 프로그래머스 깊이/너비 우선 탐색(DFS/BFS) 여행경로
// https://programmers.co.kr/learn/courses/30/lessons/43164
// 풀이 : hogumachu

import Foundation

func solution(_ tickets: [[String]]) -> [String] {
    var dict: [String: [(String, Int)]] = [:]
    var result: [String] = []
    var finished = false
    var count = 0

    for ticket in tickets {
        if dict[ticket[0]] != nil {
            dict[ticket[0]]!.append((ticket[1], count))
        } else {
            dict[ticket[0]] = [(ticket[1], count)]
        }
        count += 1
    }

    let visited: [Bool] = Array(repeating: false, count: count)

    func visit(_ now: String, _ path: [String], _ vi: [Bool]) {
        if path.count == tickets.count + 1 {
            result = path
            finished = true
            return
        }

        if dict[now] == nil {
            return
        }

        for next in dict[now]!.sorted(by: { $0.0 < $1.0 }) {
            if !vi[next.1] && !finished {
                var newVisited = vi
                newVisited[next.1] = true
                visit(next.0, path + [next.0], newVisited)
            }
        }
    }

    visit("ICN", ["ICN"], visited)

    return result
}
