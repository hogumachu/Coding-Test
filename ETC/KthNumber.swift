// 출처 : 프로그래머스 정렬 K번째수
// https://programmers.co.kr/learn/courses/30/lessons/42748
// 풀이 : hogumachu 


import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {

    var result: [Int] = []
    var value: [Int] = []
    var k: Int = 0

    for i in 0..<commands.count {
        for j in commands[i][0] - 1..<commands[i][1] {
            value.append(array[j])
            k += 1
        }
        value.sort()
        result.append(value[commands[i][2] - 1])
        value.removeAll()
        k = 0
    }

    return result
}
