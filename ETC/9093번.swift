// 출처 : 백준 단어 뒤집기
// https://www.acmicpc.net/problem/9093
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!

var value: [String] = []

for _ in 0..<input {
    value.append(readLine()!)
}

for i in value {
    let result = i.split(separator: " ")
    var resultString: String = ""
    for j in 0..<result.count {
        resultString += result[j].reversed()+" "
    }
    print(resultString)
}
