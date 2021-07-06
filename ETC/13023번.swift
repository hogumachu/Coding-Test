// 출처 : 백준 ABCDE
// https://www.acmicpc.net/problem/13023
// 풀이 : hogumachu

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0], m = nm[1]
var graph: [[Int]] = Array(repeating: [], count: n)
var visit = Array(repeating: false, count: n)
var result = 0

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

for i in 0..<n {
    visit(visit, i, 1)
}
print(result)

func visit(_ visited: [Bool], _ now: Int, _ counting: Int) {
    var v = visited
    v[now] = true
    if result == 1 {
        return
    }
    if counting == 5 {
        result = 1
        return
    }
    graph[now].forEach({
        if !v[$0] {
            visit(v, $0, counting + 1)
        }
    })
}
