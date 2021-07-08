// 출처 : 백준 텀 프로젝트
// https://www.acmicpc.net/problem/9466
// 풀이 : hogumachu

let tc = Int(readLine()!)!

for _ in 0..<tc {
    let n = Int(readLine()!)!
    var cycle = Set<Int>()
    var path: [Int] = []
    var visited = Array(repeating: false, count: n)
    let values: [Int] = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
    for i in 0..<values.count {
        if !visited[i] {
            path.append(i)
            dfs(i)
            path = []
        }
    }
    print(n - cycle.count)
    func dfs(_ now: Int) {
        visited[now] = true
        if visited[values[now]] {
            let index = path.enumerated().filter({
                $0.element == values[now]
            })
            if index.count != 0 {
                for i in index[0].offset..<path.count {
                    cycle.insert(path[i])
                }
            }
        } else {
            path.append(values[now])
            dfs(values[now])
        }
    }
}
