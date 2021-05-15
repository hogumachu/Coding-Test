// 출처 : 백준 보물
// https://www.acmicpc.net/problem/1026
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    let b = readLine()!.split(separator: " ").map{Int(String($0))!}
    let sortedA = a.sorted()
    let sortedB = b.sorted(by: >)
    var result = 0
    for i in 0..<n {
        result += sortedA[i] * sortedB[i]
    }
    print(result)
}

solution()
