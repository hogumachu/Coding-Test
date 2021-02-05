// 출처 : 백준 그리디 알고리즘 ATM
// https://www.acmicpc.net/problem/11399
// 풀이 : hogumachu

import Foundation

let _ = readLine()!
let input = readLine()!.split(separator: " ")
var array: [Int] = input.map{ Int($0)! }
var result: [Int] = []
var add: Int = 0
array.sort()

for i in array {
    add += i
    result.append(add)
}
print(result.reduce(0, { $0 + $1 }))
