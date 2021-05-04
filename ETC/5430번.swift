// 출처 : 백준 AC
// https://www.acmicpc.net/problem/5430
// 풀이 : hogumachu
// dropFirst와 Last를 사용하여 앞과 뒤에 있는 [] 를 제거하기
// 하나하나 배열을 reverse를 하면 시간 초과가 있으므로 startIndex와 endIndex로 설정하여 접근
// 굳이 배열을 Int로 할 필요 없음

import Foundation

func solution() {
    let T = Int(readLine()!)!

    for _ in 0..<T {
        let p = readLine()!
        let n = Int(readLine()!)!
        var deleteCount = 0
        var reverse = false
        let x = readLine()!.dropFirst().dropLast().split(separator: ",").map{String($0)}
        var startIndex = 0, endIndex = x.count
        var error = false
        for order in p {
            if order == "R" {
                reverse = !reverse
            } else {
                deleteCount += 1
                if x.count == 0 {
                    error = true
                    break
                } else {
                    if reverse {
                        endIndex -= 1
                    } else {
                        startIndex += 1
                    }
                }
            }
        }
        if error {
            print("error")
        } else if error == false && startIndex > endIndex {
            print("error")
        } else {
            if deleteCount > n {
                print("error")
            } else if reverse {
                print("[\(x[startIndex..<endIndex].reversed().joined(separator: ",") )]")
            } else {
                print("[\(x[startIndex..<endIndex].joined(separator: ","))]")
            }
        }

    }
}

solution()
