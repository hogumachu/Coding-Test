// 출처 : 백준 덩치
// https://www.acmicpc.net/problem/7568
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var value: [(Int, Int)] = []
var result: [Int] = []

for _ in 0..<input {
    let i = readLine()!.split(separator: " ").map{Int(String($0))!}
    value.append((i[0], i[1]))
}

for i in 0..<input {
    var count = 0
    for j in 0..<input {
        if i == j {
            continue
        }
        if value[i].0 < value[j].0, value[i].1 < value[j].1 {
            count += 1
        }
    }
    result.append(count + 1)
}

var stringResult = ""

for i in result {
    stringResult += "\(i) "
}
print(stringResult)
