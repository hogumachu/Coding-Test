// 출처 : 백준 입출력 별 찍기 - 17
// https://www.acmicpc.net/problem/10992
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var result: [String] = Array(repeating: "", count: input)
var last: Int = 2 * input - 1

var count = input - 1
var count2 = 0
for i in 0..<input - 1 {
    for _ in 0..<count {
        result[i] += " "
    }
    result[i] += "*"
    count -= 1
    if count2 != 0 {
        for _ in 0..<count2 {
            result[i] += " "
        }
        result[i] += "*"
        count2 += 2
    } else {
        count2 = 1
    }
}

for _ in 0..<last {
    result[input - 1] += "*"
}
for i in result {
    print(i)
}
