// 출처 : 백준 평균은 넘겠지
// https://www.acmicpc.net/problem/4344
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var result: [Float] = []
for _ in 1...input {
    let value = readLine()!.split(separator: " ").map{Int(String($0))!}
    let mean = Float(value.reduce(0, +) - value[0]) / Float(value[0])
    var count = 0
    for i in 1...value[0] {
        if Float(value[i]) > mean {
            count += 1
        }
    }
    result.append((Float(count)/Float(value[0])) * 100)

}

for i in result {
    print("\(String(format: "%.3f", i))%")
}
