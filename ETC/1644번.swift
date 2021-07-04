// 출처 : 백준 소수의 연속합
// https://www.acmicpc.net/problem/1644
// 풀이 : hogumachu

let n = Int(readLine()!)!

var boolPrimes: [Bool] = Array(repeating: true, count: n + 1)
var primes: [Int] = []
var result = 0
var now = 0
var left = 0
var right = 0

boolPrimes[0] = false
boolPrimes[1] = false

if n != 1 {
    for i in 2...n {
        if boolPrimes[i] {
            primes.append(i)
            for j in 2...n {
                if i * j <= n {
                    boolPrimes[i * j] = false
                } else {
                    break
                }
            }
        }
    }
}

for i in 0..<primes.count {
    if now < n {
        now += primes[i]
    } else {
        right = i
        break
    }
}
if right == 0 {
    right = primes.count
}
while true {
    if now == n {
        result += 1
        if right == primes.count {
            break
        }
        now -= primes[left]
        now += primes[right]
        left += 1
        right += 1
    } else if now > n {
        now -= primes[left]
        left += 1
    } else {
        if right == primes.count {
            break
        }
        now += primes[right]
        right += 1
    }
}

print(result)
