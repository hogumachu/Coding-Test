// 출처 : 프로그래머스 완전탐색 카펫
// https://programmers.co.kr/learn/courses/30/lessons/42842
// 풀이 : hogumachu

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {

    var x = Double(brown)
    var y = Double(yellow)

    let a: Int = Int(x + 4.0 + sqrt(((x + 4.0) * (x + 4.0)) - (16.0 * (x + y)))) / 4
    let b: Int = Int(x + y) / a

    return [a,b]
}
