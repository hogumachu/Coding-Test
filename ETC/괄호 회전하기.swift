// 출처 : 프로그래머스 월간 코드 챌린지 시즌2 괄호 회전하기
// https://programmers.co.kr/learn/courses/30/lessons/76502
// 풀이 : hogumachu

import Foundation

func solution(_ s:String) -> Int {

    var values: [String] = []
    var result = 0

    for c in s {
        values.append(String(c))
    }
    if values.count % 2 != 0 {
        return 0
    }
    for _ in 0..<values.count {
        var breaked = false
        var stack: [String] = []
        for v in values {
            if v == "(" {
                stack.append("(")
            } else if v == "[" {
                stack.append("[")
            } else if v == "{" {
                stack.append("{")
            } else if v == ")" {
                if stack.count == 0 {
                    breaked = true
                    break
                } else {
                    if stack.removeLast() != "(" {
                        breaked = true
                        break
                    }
                }
            } else if v == "]" {
                if stack.count == 0 {
                    breaked = true
                    break
                } else {
                    if stack.removeLast() != "[" {
                        breaked = true
                        break
                    }
                }
            } else if v == "}" {
                if stack.count == 0 {
                    breaked = true
                    break
                } else {
                    if stack.removeLast() != "{" {
                        breaked = true
                        break
                    }
                }
            }
        }
        if !breaked && stack.count == 0{
           result += 1
        }
        let firstValue = values[0]
        var nextValue = Array(values[1...values.count-1])
        nextValue.append(firstValue)
        values = nextValue
    }

    return result
}
