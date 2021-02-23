// 출처 : 백준 회의실 배정
// https://www.acmicpc.net/problem/1931
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!

var values: [(Int,Int)] = []
var compare = 0
var result = 0
for _ in 1...input {
    let value = readLine()!.split(separator: " ").map{Int(String($0))!}
    values.append((value[0],value[1]))
}
values.sort{
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    } else {
        return $0.1 < $1.1
    }
}

for value in values {
    if value.0 >= compare {
        compare = value.1
        result += 1
    }
}
print(result)
