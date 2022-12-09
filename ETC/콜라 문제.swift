// 출처 : 프로그래머스 콜라 문제
// https://school.programmers.co.kr/learn/courses/30/lessons/132267
// 풀이 : hogumachu

import Foundation

func solution(_ a: Int, _ b: Int, _ n: Int) -> Int {
    var bottle = n
    var result = 0
    
    while bottle / a != 0 {
        let rest = bottle % a
        bottle /= a
        bottle *= b
        result += bottle
        bottle += rest
    }
    return result
}
