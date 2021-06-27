// 출처 : 백준 N과 M (9)
// https://www.acmicpc.net/problem/15663
// 풀이 : hogumachu
// String Sorting에 대해 고민
// visited를 설정함으로 중복된 방문 제거

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
let values: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var result: Set<String> = []
var selected: [Int] = []
var visited = Array(repeating: false, count: n)

select(m)
let newResult = result.sorted(by: {
    $0.localizedStandardCompare($1) == .orderedAscending
})
for value in newResult {
    print(value)
}

func select(_ counting: Int) {
    if counting == 0 {
        result.insert(selected.map{String($0)}.joined(separator: " "))
        return
    }
    for i in 0..<n {
        if visited[i] {
            continue
        }
        visited[i] = true
        selected.append(values[i])
        select(counting - 1)
        selected.removeLast()
        visited[i] = false
    }
}
