// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 기지국 설치
// https://programmers.co.kr/learn/courses/30/lessons/12979
// 풀이 : hogumachu

import Foundation

func solution(_ n: Int, _ stations: [Int], _ w: Int) -> Int {
    var answer = 0
    var stationIndex = 0
    var now = 0

    if stations[0] - w <= 1 {
        now = stations[0] + w + 1
        stationIndex += 1
    } else {
        now = w * 2 + 2
        answer += 1
    }
    
    for i in stationIndex..<stations.count {
        while now < stations[i] - w {
            now += w * 2 + 1
            answer += 1
        }
        now = stations[i] + w + 1

    }

    while now <= n {
        now += w * 2 + 1
        answer += 1
    }

    return answer
}
