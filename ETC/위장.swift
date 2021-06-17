// 출처 : 프로그래머스 해시 위장
// https://programmers.co.kr/learn/courses/30/lessons/42578
// 풀이 : hogumachu

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesType: [String : Int] = [:]
    var counting = [Int]()
    var result = 0
    for clothe in clothes {
        if clothesType[clothe[1]] == nil {
            clothesType[clothe[1]] = 1
        } else {
            clothesType[clothe[1]]! += 1
        }
    }
    for i in clothesType {
        counting.append(i.value + 1)
    }

    for i in counting {
        if result == 0 {
            result = i
        } else {
            result *= i
        }
    }

    return result - 1
}
