// 출처 : 백준 N과 M (1)
// https://www.acmicpc.net/problem/15649
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]


    func nm(_ values: [Int]) -> Void {
        if values.count == m {
            var result = ""
            for i in values {
                result += "\(i) "
            }
            print(result)
        } else {
            for i in 1...n {
                if values.contains(i) {
                    continue
                } else {
                    var v = values
                    v.append(i)
                    nm(v)
                }
            }
        }
    }
    for i in 1...n {
        nm([i])
    }
}

solution()
