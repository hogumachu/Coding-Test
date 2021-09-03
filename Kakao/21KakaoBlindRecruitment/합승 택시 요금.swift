// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 합승 택시 요금
// https://programmers.co.kr/learn/courses/30/lessons/72413
// 풀이 : hogumachu

import Foundation

func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
    // S, A, B 에서 출발하여 다른 목적지까지의 최저 요금을 비교하는 배열
    var compareFares: [Int] = Array(repeating: Int.max, count: n + 1)

    // 그 지점을 방문해는지에 대한 배열
    var compareVisited: [Bool] = Array(repeating: false, count: n + 1)

    // 요금을 저장하기 위한 배열
    var newFares: [[(index: Int, weight: Int)]] = Array(repeating: [], count: n + 1)

    // 결과 값
    var result = Int.max

    // 기존에 있는 요금 정보를 newFares 에 저장함 (인덱스, 가격)
    for fare in fares {
        newFares[fare[0]].append((fare[1], fare[2]))
        newFares[fare[1]].append((fare[0], fare[2]))
    }

    // 핵심 함수
    func visit(_ value: Int, _ fareSum: Int) {
        // 먼저 해당 지점에 방문했다고 표시
        compareVisited[value] = true

        // 방문한 위치에서 연결된 다른 지역으로의 최소값 계산
        for next in newFares[value] {
            compareFares[next.index] = min(compareFares[next.index], next.weight + fareSum)
        }

        // 다음으로 방문할 위치는 지금까지 방문하지 않고 요금이 가장 저렴한 곳으로 방문
        let next = compareFares.enumerated().filter { !compareVisited[$0.offset] }.min { $0.element < $1.element }?.offset

        // 만약 그런 위치가 존재하고 그 위치의 요금이 Int.max (도달할 수 없는 위치) 가 아니라면 방문
        if next != nil && compareFares[next!] != Int.max {
            visit(next!, compareFares[next!])
        }

    }

    // s 에서 시작하여 다른 지점까지의 최단거리 (최소 요금) 을 계산
    compareFares[s] = 0
    visit(s, 0)

    // 그 값을 sFares 에 저장
    let sFares = compareFares

    compareFares = Array(repeating: Int.max, count: n + 1)
    compareVisited = Array(repeating: false, count: n + 1)

    // a 와 b 도 마찬가지로 aFares, bFares 에 저장
    compareFares[a] = 0
    visit(a, 0)
    let aFares = compareFares

    compareFares = Array(repeating: Int.max, count: n + 1)
    compareVisited = Array(repeating: false, count: n + 1)

    compareFares[b] = 0
    visit(b, 0)

    let bFares = compareFares

    // 지점 1에서 n 까지 반복
    for i in 1...n {
        // 만약 그 지점 모두 도달할 수 없는 위치가 아니라면 result 와 최솟값 비교
        if sFares[i] != Int.max && aFares[i] != Int.max && bFares[i] != Int.max {
            result = min(result, sFares[i] + aFares[i] + bFares[i])
        }
    }

    return result
}
