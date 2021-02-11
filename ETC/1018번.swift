// 출처 : 백준 체스판 다시 칠하기
// https://www.acmicpc.net/problem/1018
// 풀이 : hogumachu

// 너무 어렵게 푼 것 같음


import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
var chess: [[Character]]
    = [["W", "B", "W", "B", "W", "B", "W", "B"], ["B", "W", "B", "W", "B", "W", "B", "W"]]

var value: [[Character]] = Array(repeating: Array(repeating: " ", count: input[1]), count: input[0])

for i in 0..<input[0] {
    let line = readLine()!
    var count = 0
    for j in line {
        value[i][count] = j
        count += 1
    }
}


let x = input[0] - 7
let y = input[1] - 7
var result: [Int] = []
var xCount: Int = 0
var yCount: Int = 0
var startW: Int = 0
var startB: Int = 0
var white: Int = 0
var black: Int = 1
for _ in 0..<x*y {
    for m in 0..<8 {
        for n in 0..<8 {
            if value[m + xCount][n + yCount] != chess[white][n] {
                startW += 1
            }
            if value[m + xCount][n + yCount] != chess[black][n] {
                startB += 1
            }
         }
        white += 1
        black += 1
        if white == 2 { white = 0 }
        if black == 2 { black = 0 }
    }
    result.append(startW)
    result.append(startB)
    startW = 0
    startB = 0
    yCount += 1
    if yCount + 7 == input[1] {
        yCount = 0
        xCount += 1
    }
}
print(result.sorted().first!)
