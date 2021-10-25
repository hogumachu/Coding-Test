// 출처 : 프로그래머스 위클리 챌린지 12주차 피로도
// https://programmers.co.kr/learn/courses/30/lessons/87946
// 풀이 : hogumachu

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let dungeonCount = dungeons.count
    var result = 0

    func visit(_ orders: [Int]) {
        if orders.count == dungeonCount {
            var visitCount = 0
            var visitK = k

            for order in orders {
                if dungeons[order][0] <= visitK {
                    visitK -= dungeons[order][1]
                    visitCount += 1
                }
            }
            result = max(result, visitCount)
            return
        }

        for i in 0..<dungeons.count {
            if !orders.contains(i) {
                visit(orders + [i])
            }
        }
    }

    for i in 0..<dungeonCount {
        visit([i])
    }

    return result
}
