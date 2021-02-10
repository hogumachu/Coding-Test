// 출처 : 백준 직사각형에서 탈출
// https://www.acmicpc.net/problem/1085
// 풀이 : hogumachu

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let x = input[0]
let y = input[1]
let w = input[2]
let h = input[3]

var value: [Int] = []

value.append(x)
value.append(y)
value.append(abs(w - x))
value.append(abs(h - y))

let route = (Double(abs(w - x)) * Double(abs(w - x)) + Double(abs(h - y)) * Double(abs(h - y))).squareRoot()

value.sort(by: <)
if value.first! > Int(route) {
    print(route)
} else {
    print(value.first!)
}
