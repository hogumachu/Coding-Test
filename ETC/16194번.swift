// 출처 : 백준 카드 구매하기 2
// https://www.acmicpc.net/problem/16194
// 풀이 : hogumachu

let n = Int(readLine()!)!
let prices: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: 0, count: n+1)
for i in stride(from: n-1, through: 0, by: -1) {
    for j in 0...i {
        if dp[i-j] == 0 {
            dp[i-j] = dp[i+1] + prices[j]
        } else {
            dp[i-j] = min(dp[i-j], dp[i+1] + prices[j])
        }

    }
}
print(dp[0])
