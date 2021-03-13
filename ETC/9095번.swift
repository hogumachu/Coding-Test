// 출처 : 백준 1, 2, 3 더하기
// https://www.acmicpc.net/problem/9095
// 풀이 : hogumachu
// 규칙을 찾다가 단순한 점화식인 것을 알게 되었음
// 1 (1) =  [1]
// 2 (2) =  [1 1],          [2]
// 3 (4) =  [1 1 1],        [1 2, 2 1],                             [3]
// 4 (7) =  [1 1 1 1],      [1 1 2, 1 2 1, 2 1 1],                  [2 2, 1 3, 3 1]
// 5 (13) = [1 1 1 1 1],    [1 1 1 2, 1 1 2 1, 1 2 1 1, 2 1 1 1]    [1 2 2, 2 1 2, 2 2 1, 1 1 3, 1 3 1, 3 1 1],     [2 3, 3 2]
// 6 (23) = [1 1 1 1 1 1]   [1 1 1 1 2 x 5]                         [1 1 1 3 x 4, 1 1 2 2 x 6]                      [1 2 3 x 6]     [3 3]
// 이렇게 되는데 전 값과 전전값 그리고 전전전 값을 합치면 그 값이 됨
// a(4) = a(3) + a(2) + a(1)
// 따라서 a(3), a(2), a(1) 만 설정하고 반복문으로 실행함

import Foundation

func solution() -> Void {
    let T = Int(readLine()!)!
    var dp: [Int] = Array(repeating: 0, count: 1000000)
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    var result: [Int] = []
    for _ in 0..<T {
        let n = Int(readLine()!)!
        if dp[n] != 0 {
            result.append(dp[n])
        } else {
            if n <= 3 {
                result.append(dp[n])
            } else {
                for i in 4...n {
                    dp[i] = dp[i-3] + dp[i-2] + dp[i-1]
                }
                result.append(dp[n])
            }
        }
    }
    for value in result{
        print(value)
    }
}

solution()
