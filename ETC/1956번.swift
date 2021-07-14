// 출처 : 백준 운동
// https://www.acmicpc.net/problem/1956
// 풀이 : hogumachu

let ve = readLine()!.split(separator: " ").map{ Int(String($0))! }
let v = ve[0], e = ve[1]
let inf = 400 * 400 * 10_000
var result = inf
var graph: [[Int]] = Array(repeating: Array(repeating: inf, count: v + 1), count: v + 1)


for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[input[0]][input[1]] = input[2]
}

for i in 1...v {
    for j in 1...v {
        for k in 1...v {
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
        }
    }
}

for i in 1...v {
    result = result < graph[i][i] ? result : graph[i][i]
}

result = result >= inf ? -1 : result

print(result)
