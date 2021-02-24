// 출처 : 백준 택시 기하학
// https://www.acmicpc.net/problem/3053
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!

var pie = 3.14159265358979

print(String(format: "%.6f", Double(input * input) * pie))
print(String(format: "%.6f", Double(input * input * 2)))
