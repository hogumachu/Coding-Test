// 출처 : 프로그래머스 월간 코드 챌린지 시즌1 3진법 뒤집기
// https://programmers.co.kr/learn/courses/30/lessons/68935
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int) -> Int {
    var k: Int = n
    var arr: [Int] = []
    var result: Int = 0

    while k != 0 {
        arr.append(k % 3)
        k = k / 3
    }
    arr.reverse()
    for i in 0..<arr.count {
        result += arr[i] * Int(pow(3.0, Double(i)))

    }
    return result
}
