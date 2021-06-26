// 출처 : 백준 카드 구매하기
// https://www.acmicpc.net/problem/11052
// 풀이 : hogumachu

let n = Int(readLine()!)!

var dp: [Int] = Array(repeating: 0, count: n+1)
let values: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}

for i in stride(from: n-1, through: 0, by: -1) {
    for j in 0...i {
        dp[i-j] = max(dp[i-j], dp[i+1] + values[j])
    }
}

print(dp[0])
