// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 합승 택시 요금
// https://programmers.co.kr/learn/courses/30/lessons/72413
// 풀이 : hogumachu

import Foundation

func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
    // 요금을 저장할 배열 생성
    var graph: [[(Int, Int)]] = Array(repeating: [], count: n + 1)

    // 요금 저장 (양방향이므로 양쪽 다 추가함)
    for fare in fares {
        graph[fare[0]].append((fare[1], fare[2]))
        graph[fare[1]].append((fare[0], fare[2]))
    }

    // 방문 함수, now: 현재 index, visited: 방문했는지 체크하는 배열, price: 최단 가격
    func visit(_ now: Int, _ visited: [Bool], _ price: [Int]) -> [Int] {
        // visited 와 price 를 변경해야 하니 var 로 설정
        var visited = visited
        var price = price

        // 현재 방문을 true 로 함
        visited[now] = true

        // now 에서 다른 위치로 이동할 수 있는 경우 now에서 이동하는 값이 더 저렴하면 변경함
        for next in graph[now] {
            price[next.0] = min(price[now] + next.1, price[next.0])
        }

        // 방문하지 않고 요금이 가장 저렴한 위치(index)를 선택
        let nextOffset = price.enumerated().filter { !visited[$0.offset] }.min { $0.element < $1.element }?.offset

        // 만약 존재하면
        guard let next = nextOffset else { return price }

        // 해당 위치의 값이 Int.max (방문할 수 없는 위치) 가 아니면
        if price[next] != Int.max {
            // 방문함
            return visit(next, visited, price)
        }

        // 현재 값 리턴
        return price
    }

    // 방문을 위한 배열
    let visited = Array(repeating: false, count: n + 1)
    // s, a, b 에 대한 price 배열 생성
    var sPrice = Array(repeating: Int.max, count: n + 1)
    var aPrice = sPrice
    var bPrice = sPrice

    // 각각 위치 (도착 또는 출발) 의 값을 0으로 함
    sPrice[s] = 0
    aPrice[a] = 0
    bPrice[b] = 0

    // 함수 실행함
    sPrice = visit(s, visited, sPrice)
    aPrice = visit(a, visited, aPrice)
    bPrice = visit(b, visited, bPrice)

    // 결과 저장을 위한 값
    var result = Int.max

    // 만약 s, a, b 중 어느 하나라도 Int.max (방문할 수 없는 위치) 가 아니면
    // result 값을 할당함
    for i in 1...n {
        if sPrice[i] != Int.max && aPrice[i] != Int.max && bPrice[i] != Int.max {
            result = min(result, sPrice[i] + aPrice[i] + bPrice[i])
        }
    }

    return result
}
