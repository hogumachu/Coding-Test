// 출처 : 프로그래머스 월간 코드 챌린지 두 개 뽑아서 더하기
// https://programmers.co.kr/learn/courses/30/lessons/68644?language=swift
// 풀이 : hogumachu 

import Foundation

func solution(_ numbers:[Int]) -> [Int] {

    var set: Set<Int> = Set<Int>()
    var result: [Int] = []

    for i in 0..<numbers.count {
        for j in i + 1..<numbers.count {
            set.insert(numbers[i] + numbers[j])

        }
    }

    result = set.sorted()

    return result
}
