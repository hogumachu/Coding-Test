// 출처 : 프로그래머스 2019 KAKAO BLIND RECRUITMENT 실패율
// https://programmers.co.kr/learn/courses/30/lessons/42889
// 풀이 : hogumachu

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stageValue: [Int] = Array(repeating: 0, count: N+2)
    var fail: [(Double, Int)] = Array(repeating: (0.0, 0), count: N)
    for stage in stages {
        stageValue[stage] += 1
    }
    var reach = stageValue[N+1]

    for i in 1..<stageValue.count-1 {
        reach += stageValue[stageValue.count-i-1]
        if reach == 0 {
            fail[stageValue.count-2-i] = (0.0, stageValue.count-i-1)
        } else {
            fail[stageValue.count-2-i] = (Double(stageValue[stageValue.count-i-1]) / Double(reach), stageValue.count-i-1)
        }
    }
    fail.sort(by: {
        if $0.0 == $1.0 {
            return $0.1 < $1.1
        } else {
            return $0.0 > $1.0
        }
    })
    var result: [Int] = []
    for value in fail {
        result.append(value.1)
    }
    return result
}
