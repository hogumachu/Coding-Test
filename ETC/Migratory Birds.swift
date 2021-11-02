// 출처 : HackerRank Migratory Birds
// https://www.hackerrank.com/challenges/migratory-birds/problem
// 풀이 : hogumachu

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var dic: [Int: Int] = [:]
var now = 0
var maxCount = 0

for value in arr {
    if dic[value] == nil {
        dic[value] = 1
    } else {
        dic[value]! += 1
    }

    if maxCount < dic[value]! {
        now = value
        maxCount = dic[value]!
    } else if maxCount == dic[value]! && now > value {
        now = value
        maxCount = dic[value]!
    }
}

print(now)
