// 출처 : 백준 요세푸스 문제
// https://www.acmicpc.net/problem/1158
// 풀이 : hogumachu

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map{ Int($0)!}

var value: Int = input[1] - 1

var result: [Int] = []
var values: [Int] = []

for i in 1...input[0] {
    values.append(i)
}

result.append(values[value])
values.remove(at: value)

for _ in 1..<input[0] {
    value += input[1] - 1
    while value >= values.count {
        value -= values.count
    }
    result.append(values[value])
    values.remove(at: value)

}

var sol: String = "<"
for i in 0..<result.count - 1 {
    sol += "\(result[i]), "
}
sol += "\(result[result.count-1])>"

print(sol)
