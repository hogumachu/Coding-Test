// 출처 : 프로그래머스 연습문제 문자열 내 마음대로 정렬하기
// https://programmers.co.kr/learn/courses/30/lessons/12915
// 풀이 : hogumachu


import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
    var s: [String] = Array(repeating: "", count: strings.count)
    for i in 0..<strings.count {
        s[i] = String(strings[i][strings[i].index(strings[i].startIndex, offsetBy: n)])
        s[i] += strings[i]
    }
    s.sort()

    print(s)

    for i in 0..<s.count {
        s[i].removeFirst()
    }
    return s
}
