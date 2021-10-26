// 출처 : 프로그래머스 월간 코드 챌린지 시즌3 n^2 배열 자르기
// https://programmers.co.kr/learn/courses/30/lessons/87390
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    let n = Int64(n)
    var result: [Int] = Array(repeating:0, count: Int(right - left) + 1)

    for i in left...right {
        result[Int(i - left)] = (max(Int((i / n) + 1), Int(i % n + 1)))
    }

    return result
}
