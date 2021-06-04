// 출처 : 백준 쉬운 계단 수
// https://www.acmicpc.net/problem/10844
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: n+1)
    dp[1][0] = 0
    dp[1][1] = 1
    dp[1][2] = 1
    dp[1][3] = 1
    dp[1][4] = 1
    dp[1][5] = 1
    dp[1][6] = 1
    dp[1][7] = 1
    dp[1][8] = 1
    dp[1][9] = 1

    var result = dp[1].reduce(0, +)

    if n != 1 {
        for i in 2...n {
            for j in 0...9 {
                if j - 1 >= 0 {
                    dp[i][j] += dp[i-1][j-1] % 1000000000
                }
                if j + 1 < 10 {
                    dp[i][j] += dp[i-1][j+1] % 1000000000
                }
            }
        }
        result = dp[n].reduce(0, +) % 1000000000
    }
    print(result)
}
solution()
