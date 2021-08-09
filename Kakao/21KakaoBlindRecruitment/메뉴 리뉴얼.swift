// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 메뉴 리뉴얼
// https://programmers.co.kr/learn/courses/30/lessons/72411
// 풀이 : hogumachu

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var ord: [[String]] = Array(repeating: [], count: orders.count)
    var result: [String] = []
    for i in 0..<orders.count {
        ord[i] = orders[i].map { String($0) }.sorted()
    }

    for i in course {
        var dict: [String: Int] = [:]

        func visit(_ index: Int, _ count: Int, _ ordIndex: Int, _ arr: [Int]) {
            if count == 0 {
                var str = ""
                arr.forEach { i in
                    str += ord[ordIndex][i]
                }
                if dict[str] != nil {
                    dict[str]! += 1
                } else {
                    dict[str] = 1
                }
            } else if index < ord[ordIndex].count{
                for k in index..<ord[ordIndex].count {
                    visit(k + 1, count - 1, ordIndex, arr + [k])
                }
            }
        }

        for j in 0..<ord.count {
            visit(0, i, j, [])
        }

        let maxValue = dict.values.max()
        result.append(contentsOf: dict.filter { $0.value == maxValue && $0.value >= 2}.keys)
    }

    return result.sorted()
}
