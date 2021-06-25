// 출처 : 백준 이항 계수 2
// https://www.acmicpc.net/problem/11051
// 풀이 : hogumachu

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0]
let k = nk[1] > n - nk[1] ? n - nk[1] : nk[1]
var mult: [Int] = []
var div: [Int] = []

if k == 0 {
    print(1)
} else if k == 1 {
    print(nk[0])
} else {
    var dp: [[Int]] = Array(repeating: Array(repeating: 1, count: k+1), count: n+1)
    for i in 1...n {
        for j in 0...k {
            if j == 1 {
                dp[i][j] = i
            } else if i == j || j == 0 {
                dp[i][j] = 1
            } else {
                dp[i][j] = (dp[i-1][j-1] + dp[i-1][j]) % 10_007
            }
        }
    }
    print(dp[n][k] % 10_007)
}
