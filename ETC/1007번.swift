// 출처 : 백준 벡터 매칭
// https://www.acmicpc.net/problem/1007
// 풀이 : hogumachu

import Foundation

let tc = Int(readLine()!)!

for _ in 0..<tc {
    let n = Int(readLine()!)!
    var points: [(Int, Int)] = []
    var result = Double(Int.max)
    var pointSum = (0, 0)
    for _ in 0..<n {
        let value = readLine()!.split(separator: " ").map { Int(String($0))! }
        pointSum.0 += value[0]
        pointSum.1 += value[1]
        points.append((value[0], value[1]))
    }

    for i in 0..<n {
        visit([i])
    }
    print(result)

    func visit(_ indices: [Int]) {
        if indices.count == n / 2 {
            var minusSum = (0, 0)
            indices.forEach { index in
                minusSum.0 -= points[index].0
                minusSum.1 -= points[index].1
            }
            let x = Double(pointSum.0 + (minusSum.0 * 2)) * Double(pointSum.0 + (minusSum.0 * 2))
            let y = Double(pointSum.1 + (minusSum.1 * 2)) * Double(pointSum.1 + (minusSum.1 * 2))
            let sqrt = sqrt(x + y)
            result = result > sqrt ? sqrt : result
        } else {
            if indices.last! + 1 < n {
                for i in indices.last! + 1..<n {
                    visit(indices + [i])
                }
            }
        }
    }
}
