// 출처 : 백준 괄호
// https://www.acmicpc.net/problem/9012
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var value: [String] = []

for _ in 0..<input {
    value.append(readLine()!)
}

for i in value {
    var left: Int = 0
    var right: Int = 0
    var result: String = ""
    for j in i {
        if j == "(" {
            left += 1
        } else if j == ")" {
            right += 1
        }
        if left < right {
            result = "NO"
        }
    }
    if result != "NO" {
        if left == right {
            result = "YES"
        } else {
            result = "NO"
        }
    }
    print(result)
}
