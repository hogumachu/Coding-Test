// 출처 : 백준 블랙잭
// https://www.acmicpc.net/problem/2798
// 풀이 : hogumachu

// 비효율적인 느낌..


import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}

var cardValues = readLine()!.split(separator: " ").map{Int($0)!}
var sum: [Int] = []

for i in 0..<cardValues.count-2 {
    for j in i+1..<cardValues.count-1 {
        for k in j+1..<cardValues.count {
            if cardValues[i] + cardValues[j] + cardValues[k] > input[1] {
            } else if cardValues[i] + cardValues[j] + cardValues[k] == input[1] {
                sum.append(input[1])
                break
            } else {
                sum.append(cardValues[i] + cardValues[j] + cardValues[k])
            }
        }
    }
}

print(sum.max()!)
