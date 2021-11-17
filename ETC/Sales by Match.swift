// 출처 : HackerRank Sales by Match
// https://www.hackerrank.com/challenges/sock-merchant/problem
// 풀이 : hogumachu

import Foundation

_ = readLine()
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var result = 0
var socks: [Int: Int] = [:]

for value in arr {
    if socks[value] == nil {
        socks[value] = 1
    } else {
        socks[value]! += 1
        if socks[value]! == 2 {
            result += 1
            socks[value] = 0
        }
    }
}

print(result)
