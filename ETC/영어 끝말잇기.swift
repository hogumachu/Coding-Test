// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 영어 끝말잇기
// https://programmers.co.kr/learn/courses/30/lessons/12981
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var result = [0, 0]
    var dictionary: [String: Bool] = [:]
    var before = words[0].first!

    for i in 0..<words.count {
        if dictionary[words[i]] != nil || before != words[i].first! {
            result[0] = (i % n) + 1
            result[1] = (i / n) + 1
            break
        } else {
            before = words[i].last!
            dictionary[words[i]] = true
        }
    }

    return result
}
