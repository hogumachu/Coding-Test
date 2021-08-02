// 출처 : 백준 외판원 순회 2
// https://www.acmicpc.net/problem/10971
// 풀이 : hogumachu
// 시간복잡도 생각 안하고 그냥 풀었음 -> n 의 수가 매우 낮아서

let n = Int(readLine()!)!

var graph: [[Int]] = Array(repeating: [], count: n)
let v: [Bool] = Array(repeating: true, count: n)
var result = Int.max

for i in 0..<n {
    graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }

}

for i in 0..<n {
    visit(i, i, 0, 0, v)
}

print(result)

func visit(_ now: Int, _ start: Int, _ count: Int, _ sum: Int, _ canVisit: [Bool]) {
    if count == n - 1 {
        if graph[now][start] != 0 {
            result = result > sum + graph[now][start] ? sum + graph[now][start] : result
        }
    }

    for i in 0..<n {
        if canVisit[i] && i != start && graph[now][i] != 0 {
            var newVisit = canVisit
            newVisit[i] = false
            visit(i, start, count + 1, sum + graph[now][i], newVisit)
        }

    }
}
