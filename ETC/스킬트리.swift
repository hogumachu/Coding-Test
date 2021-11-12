// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 스킬트리
// https://programmers.co.kr/learn/courses/30/lessons/49993
// 풀이 : hogumachu

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0
    var order: [Character: Int] = [:]

    skill
        .map { $0 }
        .enumerated()
        .forEach { order[$0.element] = $0.offset }

    for o in skill_trees {
        var index = 0
        var canAdd = true

        for s in o {
            if order[s] != nil {
                if order[s]! == index {
                    index += 1
                } else {
                    canAdd = false
                    break
                }
            }
        }

        if canAdd {
            result += 1
        }
    }

    return result
}
