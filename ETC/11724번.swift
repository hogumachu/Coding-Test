// 출처 : 백준 연결 요소의 개수
// https://www.acmicpc.net/problem/11724
// 풀이 : hogumachu
// 그래프를 왕복이 아니라 일방향으로 append해서 계속 틀렸다 나옴
// 그래서 수정하니까 간단하게 성공함

import Foundation


func solution() -> Void {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    var vertex: [Bool] = Array(repeating: false, count: 1001)
    var graph: [[Int]] = Array(repeating: [], count: 1001)
    var vertexNum: [Int] = []
    var result = 0

    func dfs( _ num: Int) -> Void {
        if vertex[num] == false {
            vertex[num] = true
            for i in 0..<graph[num].count {
                if vertex[graph[num][i]] == false {
                    dfs(graph[num][i])
                }
            }
        }
    }
    for _ in 0..<m {
        let read = readLine()!.split(separator: " ").map{Int(String($0))!}
        if vertexNum.contains(read[0]) == false {
            vertexNum.append(read[0])
        }
        if vertexNum.contains(read[1]) == false {
            vertexNum.append(read[1])
        }
        graph[read[0]].append(read[1])
        graph[read[1]].append(read[0])
    }

    for i in vertexNum {
        if vertex[i] == false {
            dfs(i)
            result += 1
        }
    }
    result += n - vertexNum.count
    print(result)
}

solution()
