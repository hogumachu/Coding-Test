// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 스티커 모으기(2)
// https://programmers.co.kr/learn/courses/30/lessons/12971
// 풀이 : hogumachu

import Foundation

func solution(_ sticker: [Int]) -> Int{
    if sticker.count <= 2 {
        return sticker.max()!
    }

    let c = sticker.count - 1
    var sDp: [[Int]] = Array(repeating: [0, 0], count: c)
    var dp = sDp
    sDp[0][1] = sticker[0]

    for i in 1..<sticker.count - 1 {
        sDp[i][0] = max(sDp[i - 1][1], sDp[i - 1][0])
        sDp[i][1] = max(sticker[i] + sDp[i - 1][0], sDp[i - 1][1])

        dp[i][0] = max(dp[i - 1][1], dp[i - 1][0])
        dp[i][1] = max(sticker[i] + dp[i - 1][0], dp[i - 1][1])
    }

    return max(sDp[c - 1][0], sDp[c - 1][1], dp[c - 1][0] + sticker.last!, dp[c - 1][1])
}
