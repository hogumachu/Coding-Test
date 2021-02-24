// 출처 : 백준 이항 계수 1
// https://www.acmicpc.net/problem/11050
// 풀이 : hogumachu

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]
var K = 0

if N - input[1] > input[1] {
    K = input[1]
} else {
    K = N - input[1]
}

var result: Int = 1

if K != 0, K != N {
    for i in N-K+1...N{
        result *= i
    }

    for i in 1...K {
        result /= i
    }
}


print(result)
