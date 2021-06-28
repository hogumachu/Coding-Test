// 출처 : 백준 특정한 최단 경로
// https://www.acmicpc.net/problem/1504
// 풀이 : hogumachu

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], E = input[1]
var graph: [[(Int, Int)]] = Array(repeating: [], count: N + 1)
var weights = Array(repeating: 999_999_999_999, count: N + 1)
let saveWeights = weights
var visited = Array(repeating: false, count: N + 1)
let saveVisited = visited
var result: [Int] = []
for _ in 0..<E {
    let secondInput = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[secondInput[0]].append((secondInput[1],secondInput[2]))
    graph[secondInput[1]].append((secondInput[0],secondInput[2]))
}

let thirdInput = readLine()!.split(separator: " ").map{Int(String($0))!}
let v1 = thirdInput[0], v2 = thirdInput[1]

result.append(sol(v1,v2))
result.append(sol(v2, v1))
print(result.min()! == 999_999_999_999 ? -1 : result.min()!)

func sol(_ first: Int, _ second: Int) -> Int {
    weights = saveWeights
    visited = saveVisited
    weights[1] = 0
    visit(1, first)
    let firstWeight = weights[first]
    weights = saveWeights
    visited = saveVisited
    weights[first] = firstWeight
    visit(first, second)
    let secondWeight = weights[second]
    weights = saveWeights
    visited = saveVisited
    weights[second] = secondWeight
    visit(second, N)
    return weights[N]
}

func visit(_ now: Int, _ to: Int) {
    if now == to {
        return
    }
    visited[now] = true
    for i in graph[now] {
        weights[i.0] = min(weights[i.0], weights[now] + i.1)
    }
    let next = weights.enumerated()
        .filter({
            !visited[$0.offset]
        })
        .min(by: {
            $0.element < $1.element
        })?
        .offset
    if next != nil {
        visit(next!, to)
    }
}
