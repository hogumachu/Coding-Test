// 출처 : 백준 1로 만들기
// https://www.acmicpc.net/problem/1463
// 풀이 : hogumachu
// 3과 2로 모두 나눠지는 6을 고려해야 함
// 케이스를 나눠서 그에 해당하는 최소 값을 저장함 

import Foundation

func solution() -> Void {
    let n = Int(readLine()!)!
    var dp: [Int] = Array(repeating: 0, count: n+5)


    dp[1] = 0
    dp[2] = 1
    dp[3] = 1
    dp[4] = 2

    if n >= 5 {
        for i in 5...n {
            if i % 6 == 0 {
                dp[i] = min(1 + dp[i/3], 1 + dp[i/2], 1 + dp[i-1])
            } else if i % 3 == 0 {
                dp[i] = min(1 + dp[i/3], 1 + dp[i-1])
            } else if i % 2 == 0 {
                dp[i] = min(1 + dp[i/2], 1 + dp[i-1])
            } else {
                dp[i] = 1 + dp[i-1]
            }
        }
    }
    print(dp[n])
}

solution()
