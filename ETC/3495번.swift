// 출처 : 백준 아스키 도형
// https://www.acmicpc.net/problem/3495
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let h = input[0], w = input[1]
    var result: Int = 0
    for _ in 0..<h {
        let values = readLine()!.map{String($0)}
        var startIndex = -1
        var endIndex = -1
        for i in 0..<w {
            if values[i] != "." {
                if startIndex == -1 {
                    startIndex = i
                } else {
                    endIndex = i
                    result += endIndex - startIndex
                    startIndex = -1
                    endIndex = -1
                }
            }
        }
    }
    print(result)

}

solution()
