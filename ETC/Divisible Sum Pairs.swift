// 출처 : HackerRank Divisible Sum Pairs
// https://www.hackerrank.com/challenges/divisible-sum-pairs/problem
// 풀이 : hogumachu

import Foundation

let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
let ar = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var result = 0

for i in 0..<ar.count - 1 {
    for j in i + 1..<ar.count {
        if (ar[i] + ar[j]) % k == 0 {
            result += 1
        }
    }
}

print(result)
