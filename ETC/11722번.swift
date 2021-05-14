// 출처 : 백준 가장 긴 감소하는 부분 수열
// https://www.acmicpc.net/problem/11722
// 풀이 : hogumachu

import Foundation

func solution() {
    _ = readLine()
    let values: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    var table: [Int] = Array(repeating: 1, count: values.count)

    for i in 0..<values.count {
        for j in 0..<i {
            values[i] < values[j] ? (table[i] = max(table[i], table[j] + 1)) : nil
        }
    }
    print(table.max()!)
}

solution()
