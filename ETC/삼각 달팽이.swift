// 출처 : 프로그래머스 월간 코드 챌린지 시즌1 삼각 달팽이
// https://programmers.co.kr/learn/courses/30/lessons/68645
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int) -> [Int] {
    var values =  [[Int]]()
    var Moved: [(Int, Int)] = [(1, 0), (0, 1), (-1, -1)]
    var num = 1
    var selectMove = 0
    var now: (Int, Int) = (-1, 0)
    var result = [Int]()
    (1...n).forEach {
        values.append([Int](repeating:0, count: $0))
    }
    while num != n * (n+1) / 2 + 1 {
        if now.0 + Moved[selectMove].0 < 0 || now.0 + Moved[selectMove].0 == n || now.1 + Moved[selectMove].1 < 0 || now.1 + Moved[selectMove].1 == n || values[now.0 + Moved[selectMove].0][ now.1 + Moved[selectMove].1] != 0 {
            selectMove += 1
            if selectMove == 3 {
                selectMove = 0
            }
        } else {
            now.0 = now.0 + Moved[selectMove].0
            now.1 = now.1 + Moved[selectMove].1
            values[now.0][now.1] = num
            num += 1
        }
    }
    for arr in values {
        result.append(contentsOf: arr)
    }
    return result
}
