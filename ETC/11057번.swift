// 출처 : 백준 오르막 수
// https://www.acmicpc.net/problem/11057
// 풀이 : hogumachu

let n = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: 1, count: 10), count: n)

if n != 1 {
    for i in 1..<n {
        dp[i][0] = dp[i-1].reduce(0, +) % 10_007
        for j in 1...9 {
            dp[i][j] = dp[i-1][j...9].reduce(0, +) % 10_007
        }
    }
}

print(dp[n-1].reduce(0, +) % 10_007)
