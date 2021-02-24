// 출처 : 백준 카드2
// https://www.acmicpc.net/problem/2164
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var value = Array(1...input)

while value.count > 2 {
    var v: [Int] = []
    if value.count % 2 == 0 {
        for i in 0..<value.count {
            if i % 2 != 0 {
                v.append(value[i])
            }
        }
        value = v
    } else {
        v.append(value.last!)
        for i in 0..<value.count {
            if i % 2 != 0 {
                v.append(value[i])
            }
        }
        value = v
    }
}

if value.count == 2 {
    value.removeFirst()
}

print(value[0])
