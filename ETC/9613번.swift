// 출처 : 백준 GCD 합
// https://www.acmicpc.net/problem/9613
// 풀이 : hogumachu

let n = Int(readLine()!)!

for _ in 0..<n {
    let values = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result: [Int] = []
    for i in 1..<values.count - 1 {
        for j in i+1..<values.count {
            result.append(gcd(values[i], values[j]))
        }
    }
    print(result.reduce(0, +))
}

func gcd(_ A: Int, _ B: Int) -> Int {
    var a = A, b = B
    var result = 1
    var mult = 2
    while a >= mult && b >= mult {
        if a % mult == 0 && b % mult == 0 {
            result *= mult
            a /= mult
            b /= mult
        } else {
            mult += 1
        }
    }
    return result
}
