// 출처 : 백준 직사각형을 만드는 방법
// https://www.acmicpc.net/problem/8320
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var result = n

    if n > 3 {
        for i in 2...n {
            if i * i > n {
                break
            }
            result += (n/i)-(i-1)
        }
    }
    print(result)

}

solution()
