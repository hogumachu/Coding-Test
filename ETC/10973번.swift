// 출처 : 백준 이전 수열
// https://www.acmicpc.net/problem/10973
// 풀이 : hogumachu

import Foundation
let n = Int(readLine()!)!
var values: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var sortIndex = -1
for i in stride(from: n - 1, through: 1, by: -1) {
    if values[i] < values[i - 1] {
        var swapIndex = -1
        var swapValue = 0
        for j in stride(from: n - 1, to: i, by: -1) {
            if values[j] < values[i - 1] && values[j] > swapValue {
                swapValue = values[j]
                swapIndex = j
            }
        }
        if swapIndex == -1 {
            values.swapAt(i, i - 1)
            sortIndex = i
        } else {
            values.swapAt(swapIndex, i - 1)
            sortIndex = i
        }
        break
    }
}
if sortIndex == -1 {
    print(sortIndex)
} else {
    values.enumerated().filter{$0.offset >= sortIndex}.sorted(by: {$0.element > $1.element}).forEach({
        values[sortIndex] = $0.element
        sortIndex += 1
    })

    var result = ""
    values.forEach({
        result += "\($0) "
    })
    print(result)
}
