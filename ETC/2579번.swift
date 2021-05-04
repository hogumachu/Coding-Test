// 출처 : 백준 계단 오르기
// https://www.acmicpc.net/problem/2579
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var stair: [Int] = []
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: n)
    for _ in 0..<n {
        let value = Int(readLine()!)!
        stair.append(value)
    }

    if n == 1 {
        print(stair[0])
    } else if n == 2 {
        print(stair[0]+stair[1])
    } else {
        result[0][0] = stair[0]
        result[0][1] = 0
        result[1][0] = stair[0]+stair[1]
        result[1][1] = stair[1]

        for i in 2..<n {
            result[i][0] = result[i-1][1] + stair[i]
            result[i][1] = max(result[i-2][0], result[i-2][1]) + stair[i]
        }
        print(max(result[n-1][0], result[n-1][1]))
    }
}

solution()
