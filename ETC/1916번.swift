// 출처 : 백준 최소비용 구하기
// https://www.acmicpc.net/problem/1916
// 풀이 : hogumachu

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph: [[(Int, Int)]] = Array(repeating: [], count: n+1)
var visited: [Bool] = Array(repeating: false, count: n+1)
var weights: [Int] = Array(repeating: 100000 * 1000, count: n+1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input[0]].append((input[1], input[2]))
}
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let start = input[0], destination = input[1]
weights[start] = 0
visit(start)
print(weights[destination])

func visit(_ now: Int) -> Void {
    if now == destination {
        return
    }
    visited[now] = true
    for i in graph[now] {
        weights[i.0] = min(weights[i.0], weights[now] + i.1)
    }

    var mini = 100000 * 1000
    var next = -1
    for i in 1..<weights.count {
        if !visited[i] && mini > weights[i] {
            mini = weights[i]
            next = i
        }
    }
    visit(next)
}
