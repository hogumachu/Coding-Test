// 출처 : 백준 랜선 자르기
// https://www.acmicpc.net/problem/1654
// 풀이 : hogumachu

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let K = input[0], N = input[1]
var values: [Int] = []

for _ in 1...K {
    values.append(Int(readLine()!)!)
}

var max = 2147483648
var min = 0
var mid = 0
var result: [Int] = []

while min < max - 1 {
    mid = (min + max) / 2
    let sum = values.map{$0 / mid}.reduce(0, +)

    if sum >= N {
        min = mid
    } else {
        max = mid
    }
}

print(min)
