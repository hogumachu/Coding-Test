// 출처 : 백준 알파벳 찾기
// https://www.acmicpc.net/problem/10809
// 풀이 : hogumachu

import Foundation

let input = readLine()!

var alpha: [Int] = Array(repeating: -1, count: 26)
var result = ""
var count = 0

for i in input {
    if alpha[Int(i.asciiValue! - 97)] == -1 {
        alpha[Int(i.asciiValue! - 97)] = count
    }
    count += 1
}

for i in alpha {
    result += "\(i) "
}

print(result)
