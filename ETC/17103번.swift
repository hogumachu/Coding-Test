// 출처 : 백준 골드바흐 파티션
// https://www.acmicpc.net/problem/17103
// 풀이 : hogumachu

let TC = Int(readLine()!)!
var boolPrimes = Array(repeating: true, count: 1_000_001)
boolPrimes[0] = false
boolPrimes[1] = false

for i in 2...1_000_000 {
    if boolPrimes[i] {
        for j in 2...1_000_000 {
            if i * j <= 1_000_000 {
                boolPrimes[i * j] = false
            } else {
                break
            }
        }
    }
}

for _ in 0..<TC {
    let n = Int(readLine()!)!
    var result = 0

    for i in 2...n {
        if i > n - i {
            break
        } else if boolPrimes[i] && boolPrimes[n - i] {
            result += 1
        }
    }
    print(result)
}
