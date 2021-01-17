// 출처 : 프로그래머스 연습문제 서울에서 김서방 찾기
// https://programmers.co.kr/learn/courses/30/lessons/12919
// 풀이 : hogumachu

import Foundation

func solution(_ seoul:[String]) -> String {
    var result: Int = 0

    for i in 0..<seoul.count {
        if seoul[i] == "Kim" {
            result = i
            break
        }
    }

    return "김서방은 \(result)에 있다"
}
