// 출처 : 백준 구간 합 구하기 5
// https://www.acmicpc.net/problem/11660
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    var table: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)


    let secondInput = readLine()!.split(separator: " ").map{Int(String($0))!}
    table[0][0] = secondInput[0]

    if n != 1 {
        for i in 1..<n {
            table[0][i] += secondInput[i] + table[0][i-1]
        }
        for i in 1..<n {
            let values = readLine()!.split(separator: " ").map{Int(String($0))!}
            table[i][0] = table[i-1][0] + values[0]
            for j in 1..<n {
                table[i][j] = table[i][j-1] + table[i-1][j] - table[i-1][j-1] + values[j]
            }
        }
    }
    for _ in 0..<m {
        let thirdInput = readLine()!.split(separator: " ").map{Int(String($0))!}
        let x1 = thirdInput[0]-1, y1 = thirdInput[1] - 1, x2 = thirdInput[2] - 1, y2 = thirdInput[3] - 1
        if x1 == 0 && y1 == 0 {
            print(table[x2][y2])
        } else if x1 == 0 && y1 != 0 {
            print(table[x2][y2] - table[x2][y1-1])
        } else if x1 != 0 && y1 == 0 {
            print(table[x2][y2] - table[x1-1][y2])
        } else {
            print(table[x2][y2] - table[x1-1][y2] - table[x2][y1-1] + table[x1-1][y1-1])
        }
    }
}

solution()
