// 출처 : 백준 트리의 지름
// https://www.acmicpc.net/problem/1967
// 풀이 : hogumachu

let n = Int(readLine()!)!
var graph: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
var visited: [Bool] = Array(repeating: false, count: n + 1)
var weights: [Int] = Array(repeating: 0, count: n + 1)
(0..<n-1).forEach({ _ in
    let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input[0]].append((input[1], input[2]))
    graph[input[1]].append((input[0], input[2]))
})
visit(1)

let maxIndex = weights.enumerated().filter({
    $0.element == weights.max()
})[0].offset

weights = Array(repeating: 0, count: n + 1)
visited = Array(repeating: false, count: n + 1)

visit(maxIndex)
print(weights.max()!)

func visit(_ now: Int) {
    visited[now] = true
    for i in graph[now] {
        if !visited[i.0] {
            weights[i.0] = i.1 + weights[now]
            visit(i.0)
        }
    }

}
