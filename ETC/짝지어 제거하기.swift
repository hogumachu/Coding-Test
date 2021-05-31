// 출처 : 프로그래머스 2017 팁스타운 짝지어 제거하기
// https://programmers.co.kr/learn/courses/30/lessons/12973
// 풀이 : hogumachu

import Foundation

func solution(_ s:String) -> Int{
    var answer:Int = -1
    var stack: [Character] = []

    for c in s {
        if stack.isEmpty {
            stack.append(c)
        } else {
            if stack.last! == c {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
    }

    if stack.isEmpty {
        answer = 1
    } else {
        answer = 0
    }

    return answer
}
