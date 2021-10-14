// 출처 : 프로그래머스 위클리 챌린지 10주차 교점에 별 만들기
// https://programmers.co.kr/learn/courses/30/lessons/87377
// 풀이 : hogumachu

import Foundation

func solution(_ line:[[Int]]) -> [String] {
    var location: [(x: Int, y: Int)] = []
    var maxX = Int.min
    var minX = Int.max
    var maxY = Int.min
    var minY = Int.max

    for i in 0..<line.count - 1 {
        for j in i + 1..<line.count {
            let abe = line[i]
            let cdf = line[j]
            let adbc = abe[0] * cdf[1] - abe[1] * cdf[0]
            let bfed = abe[1] * cdf[2] - abe[2] * cdf[1]
            let ecaf = abe[2] * cdf[0] - abe[0] * cdf[2]

            if adbc != 0 && bfed % adbc == 0 && ecaf % adbc == 0 {
                location.append((bfed / adbc, ecaf / adbc))

                maxX = max(location.last!.x, maxX)
                minX = min (location.last!.x, minX)
                maxY = max(location.last!.y, maxY)
                minY = min(location.last!.y, minY)
            }
        }
    }
    var arr = Array(repeating: Array(repeating: ".", count: maxX - minX + 1), count: maxY - minY + 1)

    for location in location {
        arr[location.y - minY][location.x - minX] = "*"
    }

    var result: [String] = []

    for arr in arr.reversed() {
        result.append(arr.reduce("", +))
    }

    return result
}
