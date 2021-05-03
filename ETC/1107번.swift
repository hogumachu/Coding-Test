// 출처 : 백준 리모컨
// https://www.acmicpc.net/problem/1107
// 풀이 : hogumachu
// 뻘짓 너무 많이 했음
// 케이스 여러 개를 찾지 말고
// 브루트포스 방식으로 해결하기
// 수가 크지 않았을 때는 비효율적으로 해결해도 가능한지 생각하기

import Foundation

func solution() {
    let now = 100
    let N = Int(readLine()!)!
    let M = Int(readLine()!)!
    var notButton: [Int] = []
    if M != 0 {
        notButton = readLine()!.split(separator: " ").map{Int($0)!}
    }
    var result = abs(N-now)

    func recursive(_ num: Int) {
        if num.digit >= 6 {
            return
        }

        for i in 0...9 {
            if notButton.contains(i) == false  {
                let compare = num*10 + i
                if compare == 0 {
                    result = min(result, (abs(N - compare)+1))
                } else {
                    result = min(result, (abs(N - compare)+compare.digit))
                    recursive(compare)
                }
            }
        }
    }
    recursive(0)
    print(result)
}

extension Int {
    var digit: Int {
        var n = self
        var count = 0
        while n > 0 {
            n /= 10
            count += 1
        }
        return count
    }
}

solution()
