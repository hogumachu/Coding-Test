// 출처 : 백준 패션왕 신해빈
// https://www.acmicpc.net/problem/9375
// 풀이 : hogumachu

import Foundation

let T = Int(readLine()!)!
var result = Array(repeating: 1, count: T)
for i in 0..<T {
    let n = Int(readLine()!)!
    var wear: [String:Int] = [:]
    for _ in 0..<n {
        let read = readLine()!.split(separator: " ")
        if wear[String(read.last!)] == nil {
            wear.updateValue(1, forKey: String(read.last!))
        } else {
            wear[String(read.last!)]! += 1
        }
    }
    for wear in wear {
        result[i] *= (wear.value + 1)
    }
    result[i] -= 1

}

for result in result {
    print(result)
}
