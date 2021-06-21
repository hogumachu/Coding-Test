// 출처 : 프로그래머스 2017 팁스타운 예상 대진표
// https://programmers.co.kr/learn/courses/30/lessons/12985
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var counting = 1
    var low = a
    var high = b
    var divN = n
    if a > b {
        low = b
        high = a
    }
    while divN != 0 {
        if high - low == 1 && (low % 2 == 1 && high % 2 == 0) {
            return counting
        } else {
            for i in 1...divN/2 {
                if i * 2 == low || i * 2 - 1 == low {
                    low = i
                }
                if  i * 2 == high || i * 2 - 1 == high {
                    high = i
                }
            }
            divN /= 2
            counting += 1
        }
    }
    return counting
}
