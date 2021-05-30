// 출처 : 백준 알약
// https://www.acmicpc.net/problem/4811
// 풀이 : hogumachu

import Foundation

func solution() {
    var dp: [Int] = Array(repeating: 0, count: 31)
    dp[1] = 1
    dp[2] = 2
    while true {
        let n = Int(readLine()!)!
        if n == 0 {
            return
        }
        if n > 2 {
            for i in 3...n {
                if dp[i] == 0 {
                    dp[i] = dp[i-1] * 2*i * (2*i-1) / (i * (i+1))
                }
            }
        }
        print(dp[n])
    }

}

solution()
