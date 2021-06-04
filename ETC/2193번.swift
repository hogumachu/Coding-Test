// 출처 : 백준 이친수
// https://www.acmicpc.net/problem/2193
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: 2)
    dp[0][1] = 0
    dp[1][1] = 1
    var result = 1

    if n != 1 {
        for i in 2...n {
            dp[0][i] = dp[0][i-1] + dp[1][i-1]
            dp[1][i] = dp[0][i-1]
            result = dp[0][i] + dp[1][i]
        }
    }
    print(result)

}
solution()
