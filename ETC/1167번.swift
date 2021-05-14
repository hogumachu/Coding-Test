// 출처 : 백준 트리의 지름
// https://www.acmicpc.net/problem/1167
// 풀이 : hogumachu
// 제일 처음 연결되어 있는 노드를 선택하여 dfs 진행
// 진행 후에 가장 거리가 먼 (트리의 지름) 노드인 maxNode를 선택 후
// 다시 dfs 진행함
// 그리고 또 maxNode를 얻어 다시 한 번 진행


import Foundation

func solution() {
    let n = Int(readLine()!)!
    var table: [[(Int, Int)]] = Array(repeating: [], count: n+1)
    var maxNode = 0
    var maxNodeSum = 0
    var visited: [Bool] = Array(repeating: false, count: n+1)

    for _ in 0..<n {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        for i in 1..<value.count/2 {
            table[value[0]].append((value[i*2 - 1], value[i*2]))
        }
    }

    func visit(_ destination: Int, _ sum: Int) -> Void {
        visited[destination] = true
        if maxNodeSum <= sum {
            maxNodeSum = sum
            maxNode = destination
        }
        for i in 0..<table[destination].count {
            if visited[table[destination][i].0] == false {
                visit(table[destination][i].0, sum+table[destination][i].1)
            }
        }
    }

    for i in 1...n {
        if table[i].count != 0 {
            visited[i] = true
            maxNode = i
            maxNodeSum = table[i][0].1
            visit(table[i][0].0, table[i][0].1)
            break
        }
    }


    visited = Array(repeating: false, count: n+1)
    visited[maxNode] = true
    visit(table[maxNode][0].0, table[maxNode][0].1)

    visited = Array(repeating: false, count: n+1)
    visited[maxNode] = true
    visit(table[maxNode][0].0, table[maxNode][0].1)

    print(maxNodeSum)
}

solution()
