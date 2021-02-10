// 출처 : 백준 알파벳 개수
// https://www.acmicpc.net/problem/10808
// 풀이 : hogumachu

import Foundation

let input = readLine()!

var alpha: [Int] = Array(repeating: 0, count: 26)
var result = ""

for i in input {
    alpha[Int(i.asciiValue! - 97)] += 1
}

for i in alpha {
    result += "\(i) "
}

print(result)
