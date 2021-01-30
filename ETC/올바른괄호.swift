// 출처 : 프로그래머스 연습문제 올바른 괄호
// https://programmers.co.kr/learn/courses/30/lessons/12909
// 풀이 : hogumachu

import Foundation

func solution(_ s:String) -> Bool
{
    var result: Bool = false
    var left: Int = 0
    var right: Int = 0

    for i in s {
        if i == "(" {
            left += 1
        } else if == ")" {
            right += 1
        }
        if left < right {
            result = false
            break
        }
    }

    if left == right {
        result = true
    }


    return result
}
