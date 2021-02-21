// 출처 : 백준 통계학
// https://www.acmicpc.net/problem/2108
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!

var value: [Int : Int] = [:]
var value2 = [Int]()
var sum = 0

for _ in 1...input {
    let num = Int(readLine()!)!
    sum += num
    value2.append(num)
    if value[num] == nil {
        value[num] = 1
    } else {
        value[num]! += 1
    }
}

value2.sort(by: <)
let sortedOne = value.sorted{return $0.0 < $1.0}
var sortedTwo = sortedOne.sorted{return $0.1 > $1.1}

print(Int(round(Float(sum)/Float(input))))
print(value2[value2.count / 2])

if sortedTwo.count != 1 {
    let first = sortedTwo.removeFirst()
    if first.value > sortedTwo.first!.value {
        print(first.key)
    } else {
        print(sortedTwo.first!.key)
    }
} else if sortedTwo.count == 1 {
    print(sortedTwo.first!.key)
}

print(value2.last! - value2.first!)
