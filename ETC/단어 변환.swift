// 출처 : 프로그래머스 깊이/너비 우선 탐색(DFS/BFS) 단어 변환
// https://programmers.co.kr/learn/courses/30/lessons/43163
// 풀이 : hogumachu

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    let visited: [Bool] = Array(repeating: false, count: words.count)
    var result = Int.max

    func canConvert(_ now: String, _ str: String) -> Bool {
        let nowArr = Array(now)
        let strArr = Array(str)
        var count = 0

        for i in 0..<nowArr.count {
            if nowArr[i] != strArr[i] {
                count += 1
            }
            if count == 2 {
                return false
            }
        }
        return true
    }

    func visit(_ now: String, _ v: [Bool], _ count: Int) {
        if count >= result || count > words.count {
            return
        }

        if now == target {
            result = min(result, count)
            return
        }

        for i in 0..<words.count {
            if !v[i] && canConvert(now, words[i]) {
                var newV = v
                newV[i] = true
                visit(words[i], newV, count + 1)
            }
        }
    }

    visit(begin, visited, 0)

    if result == Int.max {
        result = 0
    }

    return result
}
