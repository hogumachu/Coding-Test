// 출처 : 프로그래머스 힙(Heap) 이중우선순위큐
// https://programmers.co.kr/learn/courses/30/lessons/42628
// 풀이 : hogumachu

import Foundation

func solution(_ operations: [String]) -> [Int] {
    var queue: [Int] = []
    for operation in operations {
        let order = operation.split(separator: " ")

        switch order[0] {
        case "I":
            queue.append(Int(order[1])!)
            queue.sort()
        case "D":
            if !queue.isEmpty {
                switch order[1] {
                case "1":
                    let value = queue.removeLast()
                case "-1":
                    let value = queue.removeFirst()
                default:
                    break
                }
            }
        default:
            break
        }
    }

    if queue.isEmpty {
        return [0, 0]
    } else {
        return [queue.last!, queue.first!]
    }
}
