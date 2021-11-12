// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 배달
// https://programmers.co.kr/learn/courses/30/lessons/12978
// 풀이 : hogumachu

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var weight = Array(repeating: 500_001, count: N + 1)
    var visited = Array(repeating: false, count: N + 1)
    var location: [[(Int, Int)]] = Array(repeating: [], count: N + 1)

    for road in road {
        location[road[0]].append((road[1], road[2]))
        location[road[1]].append((road[0], road[2]))
    }

    for v in location[1] {
        weight[v.0] = min(v.1, weight[v.0])
    }

    func visit(_ now: Int, _ sum: Int) {
        visited[now] = true

        for location in location[now] {
            weight[location.0] = min(weight[location.0], location.1 + sum)
        }

        let next = weight
            .enumerated()
            .filter { !visited[$0.offset] }
            .min(by: { $0.element < $1.element })?
            .offset

        if let next = next, weight[next] != 500_001 {
            visit(next, weight[next])
        }
    }

    visit(1, 0)

    return weight[2...].filter { $0 <= k }.count + 1
}
