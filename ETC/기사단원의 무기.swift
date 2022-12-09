// 출처 : 프로그래머스 기사단원의 무기
// https://school.programmers.co.kr/learn/courses/30/lessons/136798
// 풀이 : hogumachu

import Foundation

func solution(_ number: Int, _ limit: Int, _ power: Int) -> Int {
    var values = Array(repeating: 0, count: number + 1)
    var result = 0
    
    for i in 1...number {
        for j in i...number {
            if i * j > number {
                break
            }
            values[i * j] += 1
            if i != j {
                values[i * j] += 1
            }
        }
    }
    
    
    for i in 1...number {
        result += values[i] <= limit ? values[i] : power
    }
    
    return result
}
