// 출처 : 프로그래머스 연습문제 땅따먹기
// https://programmers.co.kr/learn/courses/30/lessons/12913
// 풀이 : hogumachu

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var result = 0
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 4), count: land.count)
    let notThis: [(Int, Int, Int)] = [(1,2,3),(0,2,3),(0,1,3),(0,1,2)]
    dp[0][0] = land[0][0]
    dp[0][1] = land[0][1]
    dp[0][2] = land[0][2]
    dp[0][3] = land[0][3]
    if land.count != 1 {
        for i in 1..<land.count {
            for j in 0..<land[i].count {
                dp[i][j] = max(dp[i-1][notThis[j].0], dp[i-1][notThis[j].1], dp[i-1][notThis[j].2]) + land[i][j]
            }
        }
    }
    result = max(dp[land.count-1][0], dp[land.count-1][1], dp[land.count-1][2], dp[land.count-1][3])
    return result
}

print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
