// 출처 : 프로그래머스 정렬 K번째수
// https://programmers.co.kr/learn/courses/30/lessons/42748
// 풀이 : hogumachu

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    for command in commands {
        let i = command[0] - 1, j = command[1] - 1, k = command[2] - 1
        var arr: [Int] = []
        for a in i...j {
            arr.append(array[a])
        }
        arr.sort()
        result.append(arr[k])
    }
    return result
}
