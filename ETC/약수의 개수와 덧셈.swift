// 출처 : 프로그래머스 약수의 개수와 덧셈
// https://programmers.co.kr/learn/courses/30/lessons/77884
// 풀이 : hogumachu

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var result = 0
    for i in left...right {
        var counting = 0
        for j in 1...i {
            if i % j == 0 {
                counting += 1
            }
        }
        if counting % 2 == 0 {
            result += i
        } else {
            result -= i
        }
    }
    return result
}
