// 출처 : 백준 LCS 2
// https://www.acmicpc.net/problem/9252
// 풀이 : hogumachu

let a = readLine()!.map{$0}
let b = readLine()!.map{$0}
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: b.count + 1), count: a.count + 1)
var result = ""
for i in 1...a.count {
    for j in 1...b.count {
        if a[i-1] == b[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

var x = a.count
var y = b.count
while dp[x][y] != 0 {
    if dp[x][y] == dp[x-1][y] {
        x -= 1
    } else if dp[x][y] == dp[x][y-1] {
        y -= 1
    } else {
        result = String(a[x-1]) + result
        x -= 1
        y -= 1
    }
}
if result.isEmpty {
    print(0)
} else {
    print(dp[a.count][b.count])
    print(result)
}
