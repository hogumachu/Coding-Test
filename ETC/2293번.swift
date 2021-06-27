// 출처 : 백준 동전 1
// https://www.acmicpc.net/problem/2293
// 풀이 : hogumachu


let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]

var dp: [Int] = Array(repeating: 0, count: k+1)

dp[0] = 1

for _ in 0..<n {
    let coin = Int(readLine()!)!
    if coin <= k {
        for j in coin...k {
            dp[j] += dp[j - coin]
            dp[j] = dp[j] > 2147483648 ? 0 : dp[j]
        }
    }
}

print(dp[k])
