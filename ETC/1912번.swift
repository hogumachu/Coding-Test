// 출처 : 백준 연속합
// https://www.acmicpc.net/problem/1912
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    let values = readLine()!.split(separator: " ").map{Int(String($0))!}
    var dp: [Int] = values
    if n != 1 {
        for i in 1..<n {
            dp[i] = max(dp[i], dp[i] + dp[i-1])
        }
    }
    print(dp.max()!)
}
solution()
