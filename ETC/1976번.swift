// 출처 : 백준 여행 가자
// https://www.acmicpc.net/problem/1976
// 풀이 : hogumachu

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: n + 1)
var parent: [Int] = Array(0...n)
var visit: [Bool] = Array(repeating: false, count: n + 1)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    for j in 0..<input.count {
        if input[j] == 1 {
            graph[i + 1].append(j + 1)
        }
    }
}
let plan = readLine()!.split(separator: " ").map{ Int(String($0))! }

for i in 1...n {
    if !visit[i] {
        visit(i)
    }
}

let planParent = plan.map{ getParent($0) }
var result = "YES"
for i in 1..<planParent.count {
    if planParent[i - 1] != planParent[i] {
        result = "NO"
        break
    }
}
print(result)

func visit(_ node: Int) {
    visit[node] = true
    for i in graph[node] {
        if !visit[i] {
            union(node, i)
            visit(i)
        }
    }
}

func getParent(_ x: Int) -> Int{
    if parent[x] == x {
        return x
    } else {
        return getParent(parent[x])
    }
}


func union(_ x: Int, _ y: Int) {
    if getParent(x) < getParent(y) {
        parent[y] = getParent(x)
    } else {
        parent[x] = getParent(y)
    }
}
