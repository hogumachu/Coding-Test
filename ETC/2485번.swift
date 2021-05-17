// 출처 : 백준 가로수
// https://www.acmicpc.net/problem/2485
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var min = 100000000
    var values: [Int] = []
    var result = 0
    for _ in 0..<n {
        values.append(Int(readLine()!)!)
    }
    values.sort()

    func gcd(_ x: Int, _ y: Int) -> Int {
        if y == 0 {
            return x
        } else {
            return gcd(y, x%y)
        }
    }

    min = gcd(abs(values[0] - values[1]), abs(values[1] - values[2]))

    for i in 3..<n {
        min = gcd(abs(values[i-1] - values[i]), min)
    }
    for i in 1..<n {
        result += (abs(values[i-1] - values[i]) / min) - 1
    }
    print(result)
}

solution()
