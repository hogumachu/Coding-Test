// 출처 : 프로그래머스 연습문제 행렬의 곱셈
// https://programmers.co.kr/learn/courses/30/lessons/12949
// 풀이 : hogumachu

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: arr2[0].count), count: arr1.count)
    for i in 0..<arr1.count {
        for j in 0..<arr2[0].count {
            for k in 0..<arr1[i].count {
                result[i][j] += arr1[i][k] * arr2[k][j]
            }
        }
    }
    return result
}
