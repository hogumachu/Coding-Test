// 출처 : 프로그래머스 연습문제 두 정수 사이의 합
// https://programmers.co.kr/learn/courses/30/lessons/12912
// 풀이 : hogumachu

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    
    var result: Int64 = 0
    var min: Int64 = Int64(a)
    var max: Int64 = Int64(b)

    if max < min {
        let k: Int64 = max
        max = min
        min = k
    }
    for i in min...max{
        result += i
    }

    return result
}
