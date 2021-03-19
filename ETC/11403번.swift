// 출처 : 백준 경로 찾기
// https://www.acmicpc.net/problem/11403
// 풀이 : hogumachu
// 단순한 그래프 문제
// visited에 방문한 그래프를 넣어서 재방문 하지 않게 함

import Foundation

func solution() -> Void {
    let n = Int(readLine()!)!
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var graph: [[(Int)]] = Array(repeating: [], count: n)
    var visited: [(Int, Int)] = []
    for i in 0..<n {
        let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
        for j in 0..<n {
            if temp[j] == 1 {
                graph[i].append((j))
            }
        }
    }

    func visit(_ x: Int, _ start: Int) -> Void {
        for i in 0..<graph[x].count {
            result[x][graph[x][i]] = 1
            result[start][graph[x][i]] = 1

            if visited.contains(where: {$0 == (start, graph[x][i])}) == false {
                visited.append((start, graph[x][i]))
                visit(graph[x][i], start)
            }
        }
    }
    for i in 0..<n {
        visit(i, i)
    }
    for i in 0..<n {
        var printResult = ""
        for j in 0..<n {
            printResult += "\(result[i][j]) "
        }
        print(printResult)
    }
}

solution()
