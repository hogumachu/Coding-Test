// 출처 : 프로그래머스 2019 KAKAO BLIND RECRUITMENT 후보키
// https://programmers.co.kr/learn/courses/30/lessons/42890
// 풀이 : hogumachu

import Foundation

func solution(_ relation:[[String]]) -> Int {
    var order: [[Int]] = []
    var result = 0

    func visit(_ index: Int, _ count: Int, _ end: Int, _ arr: [Int]) {
        if count == 0 {
            order.append(arr)
        } else if index < end {
            for i in index..<end {
                visit(i + 1, count - 1, end, arr + [i])
            }
        }
    }

    for i in 1...relation[0].count {
        visit(0, i, relation[0].count, [])
    }

    var alreadyCandidate: [[Int]] = []

    func isCandidate(_ indices: [Int]) {
        for arr in alreadyCandidate {
            var count = 0
            for i in arr {
                if indices.contains(i) {
                    count += 1
                }
            }
            if count == arr.count {
                return
            }
        }

        var values: [String] = []

        for i in 0..<relation.count {
            var str = ""
            for j in indices {
                str += relation[i][j]
            }
            if !values.contains(str) {
                values.append(str)
            } else {
                return
            }
        }

        result += 1
        alreadyCandidate.append(indices)

    }

    order.forEach {
        isCandidate($0)
    }

    return result
}
