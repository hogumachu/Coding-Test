// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 합승 택시 요금
// https://programmers.co.kr/learn/courses/30/lessons/72413
// 풀이 : hogumachu

// S에서 시작하여 한 지점까지의 최단거리와 그 지점에서 A까지의 최단거리, B까지의 최단거리를 구하고 그 셋을 더 함
// 그 더한 값에서 가장 작은 값을 result 에 할당

import Foundation

func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
    var path: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
    var sPath = Array(repeating: Int.max, count: n + 1)
    var aPath = Array(repeating: Int.max, count: n + 1)
    var bPath = Array(repeating: Int.max, count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    var result = Int.max

    // fares 에 있는 값을 path 에 넣어줌
    for element in fares {
        path[element[0]].append((element[1], element[2]))
        path[element[1]].append((element[0], element[2]))
    }

    // s에서 시작하여 최단거리를 구하는 함수
    func sVisit(_ node: Int, _ sum: Int) {
        // 먼저 현재 노드를 방문하였다고 visited 를 true 로 하여 표시함
        visited[node] = true

        // 현재 노드에서 다른 노드로 가는 최소 값을 설정
        for value in path[node] {
            sPath[value.0] = min(sPath[value.0], value.1 + sum)
        }

        // sPath 에서 해당 index (offset) 가 방문하지 않고 그 index 에 해당 하는 값이 가장 적은 것을 next 로 설정
        if let next = sPath.enumerated().filter { !visited[$0.offset] }.min(by: {$0.element < $1.element}) {
            // 만약 next 의 element 가 무한이지 않을 때 방문함
            if next.element < Int.max {
                sVisit(next.offset, next.element)
            }
        }
    }

    // sVist 과 동일
    func aVisit(_ node: Int, _ sum: Int) {
        visited[node] = true

        for value in path[node] {
            aPath[value.0] = min(aPath[value.0], value.1 + sum)
        }

        if let next = aPath.enumerated().filter { !visited[$0.offset] }.min(by: {$0.element < $1.element}) {
            if next.element < Int.max {
                aVisit(next.offset, next.element)
            }
        }

    }

    // sVist 과 동일
    func bVisit(_ node: Int, _ sum: Int) {
        visited[node] = true

        for value in path[node] {
            bPath[value.0] = min(bPath[value.0], value.1 + sum)
        }

        if let next = bPath.enumerated().filter { !visited[$0.offset] }.min(by: {$0.element < $1.element}) {
            if next.element < Int.max {
                bVisit(next.offset, next.element)
            }
        }

    }

    // sPath 에서 시작점을 0 으로 설정하고 sVisit 을 함
    sPath[s] = 0
    sVisit(s, 0)
    // visited 를 sPath 구하는 데 사용 했으므로 다시 초기화
    visited = Array(repeating: false, count: n + 1)

    // 위와 동일
    aPath[a] = 0
    aVisit(a, 0)
    visited = Array(repeating: false, count: n + 1)

    bPath[b] = 0
    bVisit(b, 0)

    for i in 1...n {
        if sPath[i] != Int.max && aPath[i] != Int.max && bPath[i] != Int.max {
            result = min(sPath[i] + aPath[i] + bPath[i], result)
        }
    }

    return result
}
