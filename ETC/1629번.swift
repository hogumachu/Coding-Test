// 출처 : 백준 곱셈
// https://www.acmicpc.net/problem/1629
// 풀이 : hogumachu
// 간단하게 반복문으로 했는데
// 시간 초과가 나와서
// 곱하는 횟수를 반으로 줄이고
// 그만큼 곱해지는 값을 제곱으로 만들어줘서
// 횟수를 줄였음

import Foundation

func solution() -> Void {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var a = input[0], b = input[1], c = input[2]
    var result = 1
    var div = b
    var value: [(Int, Int)] = []

    while div != 0 {
        let rest = div % 2
        value.append((a, rest))
        a *= a
        a %= c
        div /= 2
    }


    for i in value {
        if i.1 == 1 {
            result *= i.0
            result %= c
        }
    }

    print(result)
}

solution()
