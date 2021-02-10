// 출처 : 백준 단어 정렬
// https://www.acmicpc.net/problem/1181
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!

var value = Set<String>()

for _ in 0..<input {
    value.insert(readLine()!)
}

var result = value.sorted()
result = result.sorted(by: { $0.count < $1.count } )

for i in result {
    print(i)
}
