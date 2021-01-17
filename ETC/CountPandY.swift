// 출처 : 프로그래머스 연습문제 문자열 내 p와 y의 개수
// https://programmers.co.kr/learn/courses/30/lessons/12916
// 풀이 : hogumachu

import Foundation

func solution(_ s:String) -> Bool
{
    var p: Int = 0
    var y: Int = 0
    var comparison: String = ""
    for i in 0..<s.count {
        comparison = String(s[s.index(s.startIndex, offsetBy: i)])
        if comparison == "p" || comparison == "P" {
            p += 1
        } else if comparison == "y" || comparison == "Y" {
            y += 1
        }
    }
    if p == y {
        return true
    } else {
        return false
    }

}
