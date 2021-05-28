// 출처 : 백준 조 짜기
// https://www.acmicpc.net/problem/2229
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    let table = readLine()!.split(separator: " ").map{Int(String($0))!}

    for i in 0..<n {
        for j in i..<n {
            dp[i][j] = table[i...j].max()! - table[i...j].min()!
        }
    }
    for i in 0..<n-1 {
        for j in i..<n-1 {
            for k in j+1..<n {
                dp[i][k] = max(dp[i][k], dp[i][j] + dp[j+1][k])
            }
        }
    }
    print(dp[0][n-1])
}

solution()
