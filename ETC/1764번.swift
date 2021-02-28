// 출처 : 백준 듣보잡
// https://www.acmicpc.net/problem/1764
// 풀이 : hogumachu

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

var DB = Set<String>()
var result: [String] = []

for _ in 1...input[0] {
    let read = readLine()!
    DB.insert(read)
}

for _ in 1...input[1] {
    let read = readLine()!
    if DB.contains(read) == true {
        result.append(read)
    }
}

result.sort(by: <)

print(result.count)

for person in result {
    print(person)
}
