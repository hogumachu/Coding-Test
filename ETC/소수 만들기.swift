// 출처 : 프로그래머스 소수 만들기
// https://programmers.co.kr/learn/courses/30/lessons/12977
// 풀이 : hogumachu

import Foundation

func solution(_ nums:[Int]) -> Int {
    var prime: [Bool] = Array(repeating: true, count: 50001)
    var result = 0
    prime[0] = false
    prime[1] = false

    for i in 2...50000 {
        if prime[i] {
            for j in 2...50000 {
                if i*j <= 50000 {
                    prime[i*j] = false
                } else {
                    break
                }
            }
        }
    }

    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count-1 {
            for k in j+1..<nums.count {
                if prime[nums[i]+nums[j]+nums[k]] {
                    result += 1
                }
            }
        }
    }
    return result
}
