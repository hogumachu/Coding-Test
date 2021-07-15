// 출처 : 백준 소수&팰린드롬
// https://www.acmicpc.net/problem/1747
// 풀이 : hogumachu

let n = Int(readLine()!)!
var isPrime: [Bool] = Array(repeating: true, count: 1_003_002)
// 1_003_001은 소수이면서 팰린드롬 수

isPrime[0] = false
isPrime[1] = false

for i in 2...1_003_001 {
    if isPrime[i] {
        for j in 2...501_502 {
            if i * j > 1_003_001 {
                break
            } else {
                isPrime[i * j] = false
            }
        }
    }
}

for i in n...1_003_002 {
    if isPrime[i] {
        let reverseI = String(i).reversed().map{ String($0) }.reduce("", +)
        if String(i) == reverseI {
            print(i)
            break
        }
    }
}
