// 출처 : 백준 피보나치 함수
// https://www.acmicpc.net/problem/1003
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!

var zero: [Int] = Array(repeating: 0, count: 41)
var one: [Int] = Array(repeating: 0, count: 41)

zero[0] = 1
one[0] = 0

zero[1] = 0
one[1] = 1

for i in 2...40 {
    zero[i] = zero[i-1] + zero[i-2]
    one[i] = one[i-1] + one[i-2]
}

for _ in 0..<input {
    let inputValue = Int(readLine()!)!

    print("\(zero[inputValue]) \(one[inputValue])")

}
