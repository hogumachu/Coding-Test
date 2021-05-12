// 출처 : 백준 N과 M (2)
// https://www.acmicpc.net/problem/15650
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]


    func visit(_ values: [Int], _ count: Int) -> Void {
        if count == 1 {
            var result = ""
            for i in values {
                result += "\(i) "
            }
            print(result)
        } else {
            if values.last!+1 > n {
                return
            } else {
                for i in values.last!+1...n {
                    var nextValues = values
                    nextValues.append(i)
                    visit(nextValues, count-1)
                }
            }
        }
    }
    for i in 1...n {
        visit([i],m)
    }
}

solution()
