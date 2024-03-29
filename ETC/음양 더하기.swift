// 출처 : 프로그래머스 월간 코드 챌린지 시즌2 음양 더하기
// https://programmers.co.kr/learn/courses/30/lessons/76501?language=swift
// 풀이 : hogumachu

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0
    for i in 0..<signs.count {
        if signs[i] {
            result += absolutes[i]
        } else {
            result -= absolutes[i]
        }
    }
    return result
}
