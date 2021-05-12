// 출처 : 백준 N과 M (8)
// https://www.acmicpc.net/problem/15657
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()

    func visit(_ values: [Int], _ count: Int) -> Void {
        if count == 1 {
            var result = ""
            for i in values {
                result += "\(i) "
            }
            print(result)
        } else {
            for i in 0..<numbers.count {
                if numbers[i] >= values.last! {
                    var nextValues = values
                    nextValues.append(numbers[i])
                    visit(nextValues, count-1)
                }
            }
        }
    }
    for i in numbers {
        visit([i],m)
    }
}

solution()
