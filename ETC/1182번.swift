// 출처 : 백준 부분수열의 합
// https://www.acmicpc.net/problem/1182
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let values = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result = 0
    let n = input[0], s = input[1]

    func visit(_ index: Int, _ sum: Int) -> Void {
        if sum == s {
            result += 1
        }
        if index == n {
            return
        }
        for i in index..<n {
            visit(i+1, sum + values[i])
        }

    }

    for i in 0..<n {
        visit(i+1, values[i])
    }
    print(result)
}

solution()
