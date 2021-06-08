// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 점프와 순간 이동
// https://programmers.co.kr/learn/courses/30/lessons/12980
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int) -> Int {
    var divN = n
    var result = 0
    while divN > 0 {
        result += divN % 2
        divN /= 2
    }
    return result
}
