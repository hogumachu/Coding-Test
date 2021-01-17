// 출처 : 프로그래머스 연습문제 나누어 떨어지는 숫자 배열
// https://programmers.co.kr/learn/courses/30/lessons/12910
// 풀이 : hogumachu

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {


    var result: [Int] = []
    for i in arr {
        if i%divisor == 0 {
            result.append(i)
        }
    }
    result.sort()
    if result.count == 0 {
        result.append(-1)
    }
    return result
}
