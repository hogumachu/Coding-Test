// 출처 : 프로그래머스 위클리 챌린지 8주차
// https://programmers.co.kr/learn/courses/30/lessons/86491
// 풀이 : hogumachu
// 간단한 문제


import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    // 최대, 최소 값을 저장하기 위한 maxNum, minNum
    var maxNum = 0
    var minNum = 0

    for size in sizes {
        // maxNum은 계속 최대값을 갱신함
        maxNum = max(maxNum, size.max()!)
        // minNum은 계속 최소값 중에 최대값으로 갱신함
        minNum = max(minNum, size.min()!)
    }
    // 둘을 곱하여 리턴
    return maxNum * minNum
}
