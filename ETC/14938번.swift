// 출처 : 백준 서강그라운드
// https://www.acmicpc.net/problem/14938
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1], r = input[2]
    var table: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    var distance: [[Int]] = Array(repeating: Array(repeating: 16, count: n+1), count: n+1)

    let tableValue = readLine()!.split(separator: " ").map{Int(String($0))!}

    for i in 1...n {
        table[i][i] = tableValue[i-1]
    }
    for _ in 0..<r {
        let readDistance = readLine()!.split(separator: " ").map{Int(String($0))!}
        distance[readDistance[0]][readDistance[1]] = readDistance[2]
        distance[readDistance[1]][readDistance[0]] = readDistance[2]
    }
    func visit(_ x: Int, _ y: Int, _ before: Int, _ canMove: Int) -> Void {
        table[x][y] = table[y][y]
        table[before][y] = table[y][y]

        if canMove == 0 {
            return
        } else {
            for i in 1...n {
                if distance[y][i] <= canMove && x != i && y != i && x != y{
                    visit(y, i, before, canMove-distance[y][i])
                }
            }
        }
    }

    for i in 1...n {
        for j in 1...n {
            if i != j && distance[i][j] <= m {
                visit(i, j, i, m-distance[i][j])
            }
        }
    }
    var max = 0

    for i in table {
        let sum = i.reduce(0, +)
        max < sum ? (max=sum) : (max=max)
    }

    print(max)
}

solution()
