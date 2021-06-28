// 출처 : 백준 특정 거리의 도시 찾기
// https://www.acmicpc.net/problem/18352
// 풀이 : hogumachu

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1], k = input[2], x = input[3]
var graph: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
var visited: [Bool] = Array(repeating: false, count: n + 1)
var weigths: [Int] = Array(repeating: 9_999_999, count: n + 1)
for _ in 0..<m {
    let input2 = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input2[0]].append((input2[1], 1))
}

weigths[x] = 0
visit(x)
var result: [Int] = []
for i in 1...n {
    if weigths[i] == k {
        result.append(i)
    }
}
if result.isEmpty {
    print(-1)
} else {
    result.forEach({
        print($0)
    })
}

func visit(_ now: Int) -> Void {
    visited[now] = true
    if weigths[now] >= k {
        return
    }
    for i in graph[now] {
        weigths[i.0] = min(weigths[i.0], weigths[now] + 1)
    }
    let next = weigths.enumerated().filter({
        !visited[$0.offset]
    }).min(by: {
        $0.element < $1.element
    })?.offset

    if next != nil {
        visit(next!)
    }
}
