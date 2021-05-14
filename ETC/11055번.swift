// 출처 : 백준 가장 큰 증가 부분 수열
// https://www.acmicpc.net/problem/11055
// 풀이 : hogumachu
import Foundation

func solution() {
    _ = readLine()
    let values: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    var table: [Int] = Array(repeating: 0, count: values.count)

    for i in 0..<values.count {
        table[i] == 0 ? (table[i] = values[i]) : nil
        for j in 0..<i {
            values[i] > values[j] ? (table[i] = max(table[i], table[j] + values[i])) : nil
        }
    }
    print(table.max()!)
}

solution()
