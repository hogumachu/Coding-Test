// 출처 : 백준 1로 만들기 2
// https://www.acmicpc.net/problem/12852
// 풀이 : hogumachu
// 전에 풀었던 1로 만들기에서 더 발전된 문제
// dp 배열 안에 어떤 루트로 값을 형성했는지에 대한 배열을 추가로 넣어줌

import Foundation

func solution() -> Void {
    let n = Int(readLine()!)!
    var dp: [(Int, [Int])] = Array(repeating: (0,[]), count: n+5)


    dp[1] = (0,[1])
    dp[2] = (1,[1,2])
    dp[3] = (1,[1,3])
    dp[4] = (2, [1,2,4])

    if n >= 5 {
        for i in 5...n {
            if i % 6 == 0 {
                if 1 + dp[i/3].0 <= 1 + dp[i/2].0, 1 + dp[i/3].0 <= 1 + dp[i-1].0 {
                    var temp = dp[i/3].1
                    temp.append(i)
                    dp[i].1 = temp
                    dp[i].0 = 1 + dp[i/3].0
                } else if 1 + dp[i/2].0 <= 1 + dp[i/3].0, 1 + dp[i/2].0 <= 1 + dp[i-1].0 {
                    var temp = dp[i/2].1
                    temp.append(i)
                    dp[i].1 = temp
                    dp[i].0 = 1 + dp[i/2].0
                } else {
                    var temp = dp[i-1].1
                    temp.append(i)
                    dp[i].1 = temp
                    dp[i].0 = 1 + dp[i-1].0
                }
            } else if i % 3 == 0 {
                if 1 + dp[i/3].0 <= 1 + dp[i-1].0 {
                    var temp = dp[i/3].1
                    temp.append(i)
                    dp[i].1 = temp
                    dp[i].0 = 1 + dp[i/3].0
                } else {
                    var temp = dp[i-1].1
                    temp.append(i)
                    dp[i].1 = temp
                    dp[i].0 = 1 + dp[i-1].0
                }
            } else if i % 2 == 0 {
                if 1 + dp[i/2].0 <= 1 + dp[i-1].0 {
                    var temp = dp[i/2].1
                    temp.append(i)
                    dp[i].1 = temp
                    dp[i].0 = 1 + dp[i/2].0
                } else {
                    var temp = dp[i-1].1
                    temp.append(i)
                    dp[i].1 = temp
                    dp[i].0 = 1 + dp[i-1].0
                }
            } else {
                var temp = dp[i-1].1
                temp.append(i)
                dp[i].1 = temp
                dp[i].0 = 1 + dp[i-1].0
            }
        }
    }
    print(dp[n].0)
    var result = ""
    for i in 0..<dp[n].1.count {
        result += "\(dp[n].1[dp[n].1.count - i - 1]) "
    }
    print(result)
}

solution()
