// 출처 : 백준 정수 삼각형
// https://www.acmicpc.net/problem/1932
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

    let firstValue = Int(readLine()!)!
    dp[0][0] = firstValue

    for i in 1..<n {
        let values = readLine()!.split(separator: " ").map{Int(String($0))!}
        dp[i][0] = values[0] + dp[i-1][0]

        for j in 1..<values.count-1 {
            dp[i][j] = values[j] + max(dp[i-1][j-1], dp[i-1][j])
        }
        dp[i][values.count-1] = values[values.count-1] + dp[i-1][values.count-2]
    }
    print(dp[n-1].max()!)
}

solution()
