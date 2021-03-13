// 출처 : 백준 다리 놓기
// https://www.acmicpc.net/problem/1010
// 풀이 : hogumachu
// 간단한 컴비네이션 문제
// 컴비네이션 (+ 팩토리얼) 을 구현하여 계산하였음
// 비효율적인 것 같은데 최대 개수가 30이라 통과한 듯

import Foundation

let T = Int(readLine()!)!

var result: [Int] = []

func combination( _ a: Int, _ b: Int) -> Int {
    // a > b
    if a == b {
        return 1
    } else if b == 1 {
        return a
    } else {
        var A: [Int] = []
        var B: [Int] = []
        for i in 1...a {
            if i == b+1 {
                break
            } else {
                if (a+1-i) % i == 0 {
                    A.append((a+1-i)/i)
                } else {
                    A.append(a+1-i)
                    B.append(i)
                }
            }
        }
        for i in 0..<B.count {
            for j in 0..<A.count {
                if A[j] % B[i] == 0 {
                    A[j] = A[j] / B[i]
                    B[i] = 1
                    break
                } else {
                    continue
                }
            }
        }
        var result = 1
        var last = 1
        for i in B {
            if i != 1 {
                last *= i
            }
        }
        for i in A {
            result *= i
        }
        return result / last

    }
}

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    result.append(combination(m, n))

}

for i in result {
    print(i)
}
