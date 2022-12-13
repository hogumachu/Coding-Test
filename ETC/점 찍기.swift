// 출처 : 프로그래머스 연습문제 점 찍기
// https://school.programmers.co.kr/learn/courses/30/lessons/140107
// 풀이 : hogumachu

import Foundation

func solution(_ k: Int, _ d: Int) -> Int64 {
    var result: Int64 = 0
    
    for i in stride(from: 0, through: d, by: k) {
        let next = Int(sqrt(Double((d * d) - (i * i))))
        let value = (next / k) + 1
        result += Int64(value)
    }
    return result
}
