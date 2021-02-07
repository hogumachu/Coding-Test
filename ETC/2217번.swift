// 출처 : 백준 그리디 알고리즘 로프
// https://www.acmicpc.net/problem/2217
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var lope: [Int] = []
var sortedLope: [Int] = []
var value: [Int] = []
for _ in 0..<input {
    lope.append(Int(readLine()!)!)
}

lope.sort()

let count: Int = lope.count
for _ in 0..<count {
    value.append(lope.count * lope[0] )
    lope.removeFirst()
}
value.sort(by: >)
print(value[0])
