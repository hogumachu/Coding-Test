// 출처 : 백준 맥주 마시면서 걸어가기
// https://www.acmicpc.net/problem/9205
// 풀이 : hogumachu

let TC = Int(readLine()!)!

for _ in 0..<TC {
    let n = Int(readLine()!)!
    var beer: [[Int]] = Array(repeating: [], count: n + 2)
    beer[0] = readLine()!.split(separator: " ").map{Int(String($0))!}
    var visited: [Bool] = Array(repeating: false, count: n + 2)
    var result = false
    var graph: [[(Int)]] = Array(repeating: [], count: n+2)
    for i in 1..<n+1 {
        beer[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
    }
    beer[n+1] = readLine()!.split(separator: " ").map{Int(String($0))!}
    for i in 0..<n+1 {
        for j in i+1..<n+2 {
            if visit(beer[i], beer[j]) {
                graph[i].append(j)
                graph[j].append(i)
            }
        }
    }
    find(0)
    print(result == true ? "happy" : "sad")
    func visit(_ now: [Int], _ to: [Int]) -> Bool {
        if abs(now[0] - to[0]) + abs(now[1] - to[1]) <= 1000 {
            return true
        } else {
            return false
        }
    }
    func find(_ next: Int) {
        if next == n + 1{
            result = true
            return
        }
        visited[next] = true
        for i in graph[next] {
            if !visited[i] {
                find(i)
            }
        }
    }
}
