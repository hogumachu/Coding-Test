// 출처 : 백준 스택
// https://www.acmicpc.net/problem/10828
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var order: [String] = []
var value: [Int] = []
for _ in 0..<input {
    order.append(readLine()!)
}

for i in order {
    let split = i.split(separator: " ")
    if split[0] == "push" {
        value.append(Int(split[1])!)
    } else if split[0] == "pop" {
        if value.last == nil {
            print(-1)
        } else {
            print(value.popLast()!)
        }
    } else if split[0] == "size" {
        print(value.count)
    } else if split[0] == "empty" {
        if value.count == 0 {
            print(1)
        } else {
            print(0)
        }
    } else if split[0] == "top" {
        if value.last == nil {
            print(-1)
        } else {
            print(value.last!)
        }
    }
}
