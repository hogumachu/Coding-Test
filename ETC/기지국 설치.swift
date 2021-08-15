// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 기지국 설치
// https://programmers.co.kr/learn/courses/30/lessons/12979
// 풀이 : hogumachu

import Foundation

func solution(_ n: Int, _ stations: [Int], _ w: Int) -> Int {
    var result = 0
    var start = 1
    var index = 0

    while start <= n && index < stations.count {
        if start >= stations[index] - w && start <= stations[index] + w {
            start = stations[index] + w + 1
            index += 1
        } else if start < stations[index] - w {
            start += 2 * w + 1
            result += 1
        }
    }

    while start <= n {
        start += 2 * w + 1
        result += 1
    }

    return result
}
