// 출처 : HackerRank Counting Valleys
// https://www.hackerrank.com/challenges/counting-valleys/problem
// 풀이 : hogumachu

import Foundation

_ = readLine()
let path = readLine()!.map { String($0) }
var result = 0
var now = 0

for path in path {
    switch path {
    case "U":
        now += 1
        if now == 0 {
            result += 1
        }
    case "D":
        now -= 1
    default:
        continue
    }
}

print(result)
