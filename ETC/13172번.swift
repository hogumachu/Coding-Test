// 출처 : 백준 Σ
// https://www.acmicpc.net/problem/13172
// 풀이 : hogumachu
// 유클리드 호제법 쓰면 풀 수 있는 문제


let x = 1_000_000_007
var result = 0
let m = Int(readLine()!)!

func mult(_ a: Int, _ b: Int) -> Int {
    if b == 1 {
        return a
    }

    if b % 2 != 0 {
        return a * mult(a, b - 1) % x
    }
    let div = mult(a, b / 2)
    return div * div % x
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 {
        return b
    }

    return gcd(b, a % b)
}

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let g = ab[0] > ab[1] ? gcd(ab[0], ab[1]) : gcd(ab[1], ab[0])
    let a = ab[0] / g
    let b = ab[1] / g
    result += b * mult(a, x - 2) % x
    result %= x
}

print(result)
