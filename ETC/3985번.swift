// 출처 : 롤 케이크
// https://www.acmicpc.net/problem/3985
// 풀이 : hogumachu

import Foundation

func solution() {
    let l = Int(readLine()!)!
    let n = Int(readLine()!)!
    var cake: [Bool] = Array(repeating: false, count: l+1)
    var max: (Int, Int) = (0,0)
    var realMax: (Int, Int) = (0, 0)
    for i in 1...n {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        if max.1 < value[1] - value[0] {
            max = (i, value[1] - value[0])
        }
        var count = 0
        for j in value[0]...value[1] {
            if cake[j] == false {
                cake[j] = true
                count += 1
            }
        }
        if realMax.1 < count {
            realMax = (i, count)
        }
    }
    print(max.0)
    print(realMax.0)
}

solution()
