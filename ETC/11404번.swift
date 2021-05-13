// 출처 : 백준 플로이드 
// https://www.acmicpc.net/problem/11404
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var table: [[Int]] = Array(repeating: Array(repeating: n*100000+1, count: n+1), count: n+1)

    func visit(_ x: Int, _ y: Int) -> Void {
        if x != y {
            for i in 1...n {
                if table[y][i] != n*100000+1 && x != i && y != i {
                    if table[x][i] == n*100000+1 {
                        table[x][i] = table[x][y] + table[y][i]
                        visit(x, i)
                    } else if table[x][i] > table[x][y] + table[y][i] {
                        table[x][i] = table[x][y] + table[y][i]
                        visit(x, i)
                    }
                }
            }
        }
    }

    for _ in 0..<m {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        table[value[0]][value[1]] = min(table[value[0]][value[1]], value[2])
    }
    for i in 1...n {
        for j in 1...n {
            if i != j && table[i][j] != n*100000+1 {
                visit(i, j)
            }
        }
    }
    for i in 1...n {
        var result = ""
        for j in 1...n {
            table[i][j] == n*100000+1 ? (result += "0 ") : (result += "\(table[i][j]) ")
        }
        print(result)
    }

}

solution()
