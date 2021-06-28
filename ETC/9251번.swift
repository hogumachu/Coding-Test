// 출처 : 백준 LCS
// https://www.acmicpc.net/problem/9251
// 풀이 : hogumachu

let A = readLine()!.map{$0}
let B = readLine()!.map{$0}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: B.count + 1), count: A.count + 1)

for i in 1...A.count {
    for j in 1...B.count {
        if A[i-1] == B[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i][j-1], dp[i-1][j])
        }
    }
}
print(dp[A.count][B.count])
