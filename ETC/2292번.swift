// 출처 : 백준 벌집
// https://www.acmicpc.net/problem/2292
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!

var count = input
var minus = 1
var result = 0

while count > 0 {
    count -= minus
    result += 1
    if minus == 1 {
        minus = 6
    } else {
        minus += 6
    }
}

print(result)
