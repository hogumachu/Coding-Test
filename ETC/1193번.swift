// 출처 : 백준 분수찾기
// https://www.acmicpc.net/problem/1193
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var count = 1
var result = 0

while input > result {
    result += count
    count += 1
}

if count % 2 != 0 {
    print("\(count - (result-input+1))/\(result-input+1)")
} else {
    print("\(result-input+1)/\(count - (result-input+1))")
}
