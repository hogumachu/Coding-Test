// 출처 : 백준 스택 수열
// https://www.acmicpc.net/problem/1874
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var value = [Int]()
var stack = [Int]()
var array = [Int]()
var result = [String]()
var valueIndex: Int = 0
var noResult = ""

for i in 1...input {
    array.append(i)
}

for _ in 0..<input {
    value.append(Int(readLine()!)!)
}

stack.append(array.first!)
result.append("+")
array.removeFirst()

while stack.count != 0 || array.count != 0 {
   if stack.last == value[valueIndex] {
        stack.removeLast()
        result.append("-")
        valueIndex += 1
    } else if stack.last == nil {
        stack.append(array.first!)
        result.append("+")
        array.removeFirst()
    } else if stack.last! < value[valueIndex] {
        stack.append(array.first!)
        result.append("+")
        array.removeFirst()
    } else {
        noResult = "NO"
        break
    }
}
if noResult == "NO" {
    print(noResult)
} else {
    for i in result {
        print(i)
    }
}
