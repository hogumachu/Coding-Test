// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 영어 끝말잇기
// https://programmers.co.kr/learn/courses/30/lessons/12981
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var result = [0, 0]
    var now = 1
    var repeating = 1
    var visited: [String] = []
    for word in words {
        if visited.contains(word) {
            result[0] = now
            result[1] = repeating
            break
        } else {
            if visited.count == 0 {
                visited.append(word)
            } else {
                if visited.last!.last! != word.first! {
                    result[0] = now
                    result[1] = repeating
                    break
                } else {
                    visited.append(word)
                }
            }
        }

        now += 1
        if now > n {
            now = 1
            repeating += 1
        }
    }
    return result
}
