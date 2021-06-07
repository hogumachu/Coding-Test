// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 스킬트리
// https://programmers.co.kr/learn/courses/30/lessons/49993
// 풀이 : hogumachu

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var skill_order: [Character : Int] = [:]
    var result = 0
    var counting = 0
    for c in skill {
        skill_order[c] = counting
        counting += 1
    }
    for skills in skill_trees {
        var skillOrderCounting = 0
        var breaked = false
        for c in skills {
            if skill_order[c] != nil {
                if skill_order[c] != skillOrderCounting {
                    breaked = true
                    break
                } else {
                    skillOrderCounting += 1
                }
            }
        }
        if !breaked {
            result += 1
        }
    }
    return result
}
