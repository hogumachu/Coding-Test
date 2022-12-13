// 출처 : 프로그래머스 연습문제 숫자 카드 나누기
// https://school.programmers.co.kr/learn/courses/30/lessons/135807
// 풀이 : hogumachu

import Foundation

func solution(_ arrayA: [Int], _ arrayB: [Int]) -> Int {
    var valueA = arrayA[0]
    var valueB = arrayB[0]
    
    for i in 0..<arrayA.count {
        valueA = gcd(valueA, arrayA[i])
        valueB = gcd(valueB, arrayB[i])
    }
    
    for i in 0..<arrayA.count {
        if valueA != 0, arrayB[i] % valueA == 0 {
            valueA = 0
        }
        
        if valueB != 0, arrayA[i] % valueB == 0 {
            valueB = 0
        }
    }
    
    let result = max(valueA, valueB)
    
    return result == 1 ? 0 : result
}

func gcd(_ a: Int, _ b: Int) -> Int {
    return a % b == 0 ? b : gcd(b, a % b)
}
