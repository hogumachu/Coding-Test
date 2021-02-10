// 출처 : 백준 숫자 카드 2
// https://www.acmicpc.net/problem/10816
// 풀이 : hogumachu

import Foundation

let _ = readLine()!
let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let _ = Int(readLine()!)!
let check = readLine()!.split(separator: " ").map{ Int(String($0))! }

var result: [Int:Int] = [:]
var printString = ""

for i in input {
    if result[i] == nil {
        result[i] = 1
    } else {
        result[i]! += 1
    }
}

for i in check {
    if result[i] != nil {
        printString += "\(result[i]!) "
    } else {
        printString += "0 "
    }
}

print(printString)
