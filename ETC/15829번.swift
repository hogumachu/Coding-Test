// 출처 : 백준 Hashing
// https://www.acmicpc.net/problem/15829
// 풀이 : hogumachu


import Foundation

func power(_ num: Int, _ pow: Int) -> Int {
    var powpow = num
    if pow == 0 {
        return 1
    } else if pow == 1 {
        return powpow % mod
    } else {
        for _ in 2...pow {
            powpow *= num
            powpow %= mod
        }
        return powpow
    }
}

let _ = readLine()!
let mod = 1234567891
let input = String(readLine()!)
var result = 0
var count = 0

for i in input {
    result += (Int(i.asciiValue!) - 96) * power(31, count) % mod
    count += 1
}

print(result % mod)
