// 출처 : 프로그래머스 연습문제 문자열 내림차순으로 배치하기
// https://programmers.co.kr/learn/courses/30/lessons/12917
// 풀이 : hogumachu

import Foundation

func solution(_ s:String) -> String {
    var str: String = ""
    str.append(contentsOf: s.sorted(by: >))

    return str
}
