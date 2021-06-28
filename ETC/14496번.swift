// 출처 : 백준 그대, 그머가 되어
// https://www.acmicpc.net/problem/14496
// 풀이 : hogumachu

let firstInput = readLine()!.split(separator: " ").map{Int(String($0))!}
let secondInput = readLine()!.split(separator: " ").map{Int(String($0))!}
let a = firstInput[0], b = firstInput[1]
let n = secondInput[0], m = secondInput[1]
var graph: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
var visited: [Bool] = Array(repeating: false, count: n + 1)
var weights: [Int] = Array(repeating: 999_999_999, count: n + 1)
for _ in 0..<m {
    let thirdInput = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[thirdInput[0]].append((thirdInput[1], 1))
    graph[thirdInput[1]].append((thirdInput[0], 1))
}
weights[a] = 0
visit(a)
print(weights[b] == 999_999_999 ? "-1" : weights[b])
func visit(_ now: Int) -> Void {
    if now == b {
        return
    }
    visited[now] = true
    for i in graph[now] {
        weights[i.0] = min(weights[i.0], weights[now] + 1)
    }
    let next = weights.enumerated()
        .filter({
            !visited[$0.offset]
        })
        .min(by:{
            $0.element < $1.element
        })?
        .offset

    if next != nil {
        visit(next!)
    }
}
