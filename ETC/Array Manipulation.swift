// 출처 : HackerRank Array Manipulation
// https://www.hackerrank.com/challenges/crush/problem
// 풀이 : hogumachu
// 해커랭크에서 주어지는 코드에 함수만 구현하면 되는데
// 그렇게 구현하니 시간 초과가 났음
// 백준처럼 readline 이용해서 input 하나하나 잡아서 푸는게 훨씬 빠름

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var values: [Int] = Array(repeating: 0, count: nm[0] + 1)
var result = Int.min
var compare = 0

for _ in 0..<nm[1] {
    let query = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    values[query[0] - 1] += query[2]
    values[query[1]] -= query[2]
}

for value in values {
    compare += value
    result = max(result, compare)
}

print(result)
