// 출처 : 백준 별자리 만들기
// https://www.acmicpc.net/problem/4386
// 풀이 : hogumachu
// 두 점 끼리의 distance 를 계산하여 값을 할당해주고 거기에  Kruskal (union) 을 이용함

import Foundation
let n = Int(readLine()!)!
var values: [[Double]] = []
var distances: [(Int, Int, Double)] = []
let first = readLine()!.split(separator: " ").map{Double(String($0))!}
var unionNum = Array(0...n)
var visited = 0
var result = 0.0
values.append(first)

for i in 1..<n {
    let input = readLine()!.split(separator: " ").map{Double(String($0))!}
    for index in 0..<values.count {
        let distance = getDistance(values[index], input)
        distances.append((index, i, distance))
    }
    values.append(input)
}
distances.sort(by: {$0.2 < $1.2})

distances.forEach({ value in
    if visited == n - 1 {
        return
    }
    if connect(value.0) != connect(value.1) {
        visited += 1
        result += value.2
        setUnion(value.0, value.1)
    }
})
print(String(format: "%.2f", result))

func getDistance(_ a: [Double], _ b: [Double]) -> Double {
    let width = a[0] - b[0]
    let height = a[1] - b[1]

    return sqrt(pow(width, 2) + pow(height, 2))
}



func connect(_ a: Int) -> Int {
    if unionNum[a] == a {
        return a
    } else {
        unionNum[a] = connect(unionNum[a])
        return unionNum[a]
    }
}

func setUnion(_ a: Int, _ b: Int) {
    a < b ? (unionNum[connect(b)] = unionNum[connect(a)]) : (unionNum[connect(a)] = unionNum[connect(b)])
}
