// 출처 : 백준 부녀회장이 될테야
// https://www.acmicpc.net/problem/2775
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var value = [Int]()

var k = 0
var n = 0
var maxK = 0
var maxN = 0

for i in 0..<input * 2 {
    let v = Int(readLine()!)!
    if i % 2 == 0 {
        if maxK < v {
            maxK = v
        }
    } else {
        if maxN < v {
            maxN = v
        }
    }
    value.append(v)
}

var floor: [[Int]] = Array(repeating: Array(repeating: 0, count: maxN), count: maxK+1 )



for i in 0..<floor.count {
    if i == 0 {
        for j in 0..<floor[0].count {
            floor[i][j] = j + 1
        }
    } else {
        var sum = 0
        for j in 0..<floor[0].count {
            sum += floor[i - 1][j]
            floor[i][j] = sum
            //print(sum)
        }
    }

}

for i in 0..<value.count {
    if i % 2 == 0 {
        k = value[i]
    } else {
        n = value[i]
        print(floor[k][n - 1])
    }
}
