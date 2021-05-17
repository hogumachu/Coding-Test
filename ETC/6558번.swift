// 출처 : 백준 골드바흐의 추측
// https://www.acmicpc.net/problem/6588
// 풀이 : hogumachu

import Foundation

func solution() {
    var isPrime: [Bool] = Array(repeating: true, count: 1000001)

    isPrime[0] = false
    isPrime[1] = false

    isPrime[2] = true
    isPrime[3] = true

    func prime(_ x: Int) -> Void {
        for i in 2...1000000 {
            if x * i > 1000000 {
                return
            }
            isPrime[x*i] = false
        }
    }
    for i in 2...500000 {
        isPrime[i] == true ? prime(i) : nil
    }

    while true {
        let n = Int(readLine()!)!
        var getValue = false
        if n == 0 {
            break
        }
        for i in 2...1000000 {
            if n - i <= 1000000 && n - i > 0 {
                if isPrime[i] == true && isPrime[n-i] == true {
                    print("\(n) = \(i) + \(n-i)")
                    getValue = true
                    break
                }
            }
        }
        if !getValue {
            print("Goldbach's conjecture is wrong.")
        }
    }
}

solution()
