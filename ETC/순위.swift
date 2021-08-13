// 출처 : 프로그래머스 그래프 순위
// https://programmers.co.kr/learn/courses/30/lessons/49191
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var arr: [[(Int, Int)]] = Array(repeating: [], count: n)
    var result = 0
    for result in results {
        let a = result[0] - 1
        let b = result[1] - 1
        arr[a].append((b, 1))
        arr[b].append((a, -1))
    }

    func visit(_ start: Int, _ now: Int, _ order: Int) {
        for i in arr[now] {
            if i.1 == order && !arr[start].contains(where: { $0.0 == i.0 }) {
                arr[start].append((i.0, i.1))
                if arr[start].count != n - 1 {
                    visit(start, i.0, order)
                }
            }
        }
    }

    for i in 0..<arr.count {
        if arr[i].count == n - 1 {
            result += 1
        } else {
            for j in arr[i] {
                visit(i, j.0, j.1)
            }
            if arr[i].count == n - 1 {
                result += 1
            }
        }
    }

    return result
}
