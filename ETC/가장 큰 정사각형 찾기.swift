// 출처 : 프로그래머스 연습문제 가장 큰 정사각형 찾기
// https://programmers.co.kr/learn/courses/30/lessons/12905
// 풀이 : hogumachu

import Foundation

func solution(_ board:[[Int]]) -> Int {
    var result = 0
    var dp = board

    for i in 0..<dp.count {
        for j in 0..<dp[0].count {
            if dp[i][j] != 0 {
                if result == 0 {
                    result = dp[i][j]
                }
                if i+1 < dp.count && j+1 < dp[0].count {
                    if dp[i+1][j] != 0 && dp[i][j+1] != 0 && dp[i+1][j+1] != 0 {
                        dp[i+1][j+1] = min(dp[i][j], dp[i+1][j], dp[i][j+1]) + 1
                        if result < dp[i+1][j+1] {
                            result = dp[i+1][j+1]
                        }
                    }
                }
            }
        }
    }

    return result*result
}
