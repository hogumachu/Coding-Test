// 출처 : 백준 포도주 시식
// https://www.acmicpc.net/problem/2156
// 풀이 : hogumachu

let n = Int(readLine()!)!
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: n)
var values: [Int] = []

for _ in 0..<n {
    values.append(Int(readLine()!)!)
}

dp[0][1] = values[0]

for i in 1..<n {
    dp[i][0] = dp[i-1].max()!
    dp[i][1] = dp[i-1][0] + values[i]
    dp[i][2] = dp[i-1][1] + values[i]
}

print(dp[n-1].max()!)
