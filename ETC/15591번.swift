// 출처 : 백준 MooTube(Silver)
// https://www.acmicpc.net/problem/15591
// 풀이 : hogumachu

func input() -> [Int] {
    return readLine()!.split { $0 == " " }.map { Int(String($0))! }
}

let NQ = input()
var nodes: [[(Int, Int)]] = Array(repeating: [], count: NQ[0] + 1)

for _ in 0..<NQ[0] - 1 {
    let input = input()

    nodes[input[0]].append((input[1], input[2]))
    nodes[input[1]].append((input[0], input[2]))
}

for _ in 0..<NQ[1] {
    let input = input()

    var queue: [(Int, Int)] = []
    var queueIndex = 0
    var result = 0
    var visited: [Bool] = Array(repeating: false, count: NQ[0] + 1)
    visited[0] = true
    visited[input[1]] = true

    queue.append(contentsOf: nodes[input[1]])

    while queue.count > queueIndex {
        let node = queue[queueIndex]
        queueIndex += 1

        if node.1 >= input[0] && !visited[node.0] {
            result += 1
            visited[node.0] = true

            bfs(index: node.0, minValue: node.1)
        }
    }

    print(result)

    func bfs(index: Int, minValue: Int) {
        for node in nodes[index] {
            let min = min(node.1, minValue)

            if min >= input[0] && !visited[node.0] {
                queue.append((node.0, min))
            }
        }
    }
}
