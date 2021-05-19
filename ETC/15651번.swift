// 출처 : 백준 N과 M (3)
// https://www.acmicpc.net/problem/15651
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]


    func nm(_ values: String, _ count: Int) -> Void {
        if count == m {
            print(values)
        } else {
            for i in 1...n {
                nm(values+"\(i) ", count+1)
            }
        }
    }
    for i in 1...n {
        nm("\(i) ", 1)
    }
}

solution()
