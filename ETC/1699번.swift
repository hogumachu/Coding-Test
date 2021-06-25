// 출처 : 백준 제곱수의 합
// https://www.acmicpc.net/problem/1699
// 풀이 : hogumachu

let n = Int(readLine()!)!
var mult = 0
var result = 4
var dp:[Int] = Array(repeating: 100000, count: n+1)
for i in 1...n {
    if i * i > n {
        break
    } else {
        dp[i * i] = 1
    }
}

for i in 1...n {
    var j = 1
    while j * j <= i {
        if dp[i] > dp[i - j * j] + 1 {
            dp[i] = dp[i - j * j] + 1
        }
        j += 1
    }
}

print(dp[n])
