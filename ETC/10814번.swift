// 출처 : 백준 나이순 정렬
// https://www.acmicpc.net/problem/10814
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var dic: [Int : String] = [:]

for _ in 0..<input {
    let value = readLine()!.split(separator: " ")
    if dic[Int(value[0])!] == nil {
        dic[Int(value[0])!] = String(value[1])
    } else {
        dic[Int(value[0])!]! += " \(String(value[1]))"
    }
}

var sortedDic = dic.sorted(by: <)

for i in sortedDic {
    let name = i.value.split(separator: " ")
    for j in name {
        print("\(i.key) \(j)")
    }
}
