// 출처 : 백준 키 순서
// https://www.acmicpc.net/problem/2458
// 풀이 : hogumachu

let ve = readLine()!.split(separator: " ").map{ Int(String($0))! }
let v = ve[0], e = ve[1]
let inf = 400 * 400 * 10_000
var result = 0
var graph: [[Int]] = Array(repeating: Array(repeating: inf, count: v + 1), count: v + 1)
var connected: [Int] = Array(repeating: 0, count: v + 1)

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[input[0]][input[1]] = 1
}

for k in 1...v {
    for i in 1...v {
        for j in 1...v {
            if graph[i][j] > graph[i][k] + graph[k][j] {
                graph[i][j] = graph[i][k] + graph[k][j]
            }
        }
    }
}

for i in 1...v {
    for j in 1...v {
        if graph[i][j] < inf {
            connected[i] += 1
            connected[j] += 1
        }
    }
}

connected.forEach({
    result += $0 == v - 1 ? 1 : 0
})

print(result)
