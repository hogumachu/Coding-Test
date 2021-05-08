// 출처 : 백준 주유소
// https://www.acmicpc.net/problem/13305
// 풀이 : hogumachu

import Foundation

func solution() {
    let _ = Int(readLine()!)!
    let length = readLine()!.split(separator: " ").map{Int(String($0))!}
    let cost = readLine()!.split(separator: " ").map{Int(String($0))!}

    var result = 0
    var minCost = cost.first!

    for i in 0..<length.count {
        if cost[i] < minCost {
            minCost = cost[i]
        }
        result += minCost * length[i]
    }
    print(result)
}

solution()
