// 출처 : 백준 평범한 배낭
// https://www.acmicpc.net/problem/12865
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], k = input[1]
    var dp: [Int] = Array(repeating: 0, count: k+1)
    var weight: [Int] = Array(repeating: 0, count: n)
    var value: [Int] = Array(repeating: 0, count: n)
    for i in 0..<n {
        let secondInput = readLine()!.split(separator: " ").map{Int(String($0))!}
        weight[i] = secondInput[0]
        value[i] = secondInput[1]
    }
    for i in 0..<n {
        for j in 0..<k {
            if weight[i] <= k-j {
                dp[k-j] = max(dp[k-j], dp[k-j-weight[i]] + value[i])
            }
        }
    }
    print(dp[k])
}

solution()
