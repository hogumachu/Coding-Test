// 출처 : 백준 큐
// https://www.acmicpc.net/problem/10845
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var queue = [Int]()

for _ in 0..<input {
    let order = readLine()!.split(separator: " ")
    switch order[0] {
    case "push":
        queue.append(Int(order[1])!)
    case "pop":
        if queue.count != 0 {
            print(queue.first!)
            queue.removeFirst()
        } else {
            print(-1)
        }
    case "size":
        print(queue.count)
    case "empty":
        if queue.count == 0 {
            print(1)
        } else {
            print(0)
        }
    case "front":
        if queue.count != 0 {
            print(queue.first!)
        } else {
            print(-1)
        }
    case "back":
        if queue.count != 0 {
            print(queue.last!)
        } else {
            print(-1)
        }
    default: break
    }
}
