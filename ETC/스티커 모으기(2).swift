// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 스티커 모으기(2)
// https://programmers.co.kr/learn/courses/30/lessons/12971
// 풀이 : hogumachu

import Foundation

func solution(_ sticker:[Int]) -> Int {
    if sticker.count <= 2 {
        return sticker.max()!
    }
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: sticker.count)
    var zdp: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: sticker.count)
    dp[0][0] = sticker[0]
    dp[1][0] = sticker[1]
    dp[1][1] = sticker[0]
    zdp[1][0] = sticker[1]

    for i in 2..<sticker.count - 1 {
        dp[i][0] = max(dp[i - 2][0], dp[i - 1][1]) + sticker[i]
        dp[i][1] = max(dp[i - 2][0], dp[i - 1][0], dp[i - 2][1], dp[i - 1][1])
        zdp[i][0] = max(zdp[i - 2][0], zdp[i - 1][1]) + sticker[i]
        zdp[i][1] = max(zdp[i - 2][0], zdp[i - 1][0], zdp[i - 2][1], zdp[i - 1][1])

    }

    zdp[sticker.count - 1][0] = zdp[sticker.count - 2][1] + sticker.last!
    zdp[sticker.count - 1][1] = zdp[sticker.count - 2].max()!

    return max(zdp[sticker.count - 1].max()!, dp[sticker.count - 2].max()!)
}
