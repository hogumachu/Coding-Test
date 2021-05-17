// 출처 : 백준 촌수계산
// https://www.acmicpc.net/problem/2644
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = input[0], b = input[1]
    let repeatCount = Int(readLine()!)!
    var connected: [[Int]] = Array(repeating: [], count: n+1)
    var queue: [(Int, Int, Int)] = []
    var visited: [Bool] = Array(repeating: false, count: n+1)
    var result = 0
    var index = 0
    for _ in 0..<repeatCount {
        let secondInput = readLine()!.split(separator: " ").map{Int(String($0))!}
        connected[secondInput[0]].append(secondInput[1])
        connected[secondInput[1]].append(secondInput[0])
    }

    visited[a] = true

    func visit(_ x: Int, _ y: Int, _ count: Int) -> Void {
        if connected[y].contains(b) {
            result = count + 1
            return
        } else {
            for i in 0..<connected[y].count {
                if x != connected[y][i] {
                    queue.append((x, connected[y][i], count+1))
                }
            }
        }

    }
    for i in 0..<connected[a].count {
        queue.append((a, connected[a][i], 1))
    }

    while queue.count != 0 && result == 0 {
        let select = queue.removeFirst()
        index += 1
        if visited[select.1] == false {
            visited[select.1] = true
            visit(select.0, select.1, select.2)
        }
    }
    result == 0 ? print(-1) : print(result)
}

solution()
