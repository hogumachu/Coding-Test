// 출처 : 백준 좌표 정렬하기
// https://www.acmicpc.net/problem/11650
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var value = [(Int, Int)]()

for _ in 0..<input {
    let inputValue = readLine()!.split(separator: " ").map{ Int($0)! }

    value.append((inputValue[0], inputValue[1]))
}


value.sort(by: {$0.1 < $1.1} )
value.sort(by: {$0 < $1} )

for i in value {
    print("\(i.0) \(i.1)")
}
