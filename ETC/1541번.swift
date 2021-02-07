// 출처 : 백준 그리디 알고리즘 잃어버린 괄호
// https://www.acmicpc.net/problem/1541
// 풀이 : hogumachu

import Foundation

var input = readLine()!.split(separator: "-")
var minus: [Int] = []
var result: Int = 0

for i in input {
    let numbers = i.components(separatedBy: "+").map{ Int($0)! }
    minus.append(numbers.reduce(0, +))
}

result = minus[0] * 2 - minus.reduce(0, {$0 + $1})

print(result)
