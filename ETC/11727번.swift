// 출처 : 백준  2xn 타일링 2
// https://www.acmicpc.net/problem/11727
// 풀이 : hogumachu
// 배열을 생성해줄 때 n+1 개 만큼 했더니 오류가 났음
// n = 1 일때 dp[2]를 설정할 수 없기 때문임
// 그래서 count 를 n+2로 바꾸니 맞았음

import Foundation

func solution() -> Void {
    let n = Int(readLine()!)!

    var dp: [Int] = Array(repeating: 0, count: n+2)
    dp[1] = 1
    dp[2] = 3

    if n <= 2 {
        print(dp[n])
    } else {
        for i in 3...n {
            if i % 2 == 0 {
                dp[i] = (2 * dp[i-1] +  1) % 10007
            } else {
                dp[i] = (2 * dp[i-1] -  1) % 10007
            }
        }
        print(dp[n])
    }
}

solution()
