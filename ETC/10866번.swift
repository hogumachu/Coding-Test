// 출처 : 백준 덱
// https://www.acmicpc.net/problem/10866
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!

var deque: [Int] = []

for _ in 0..<input {
    var value = readLine()!.split(separator: " ")

    switch value[0] {
    case "push_front":
        deque.insert(Int(value[1])!, at: 0)
    case "push_back":
        deque.append(Int(value[1])!)
    case "pop_front":
        if deque.count != 0 {
            print(deque.first!)
            deque.removeFirst()
        } else {
            print(-1)
        }
    case "pop_back":
        if deque.count != 0 {
            print(deque.last!)
            deque.removeLast()
        } else {
            print(-1)
        }
    case "size":
        print(deque.count)
    case "empty":
        if deque.count == 0 {
            print(1)
        } else {
            print(0)
        }
    case "front":
        if deque.count != 0 {
            print(deque.first!)
        } else {
            print(-1)
        }
    case "back":
        if deque.count != 0 {
            print(deque.last!)
        } else {
            print(-1)
        }
    default:
        break
    }
}
