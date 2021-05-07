// 출처 : 백준 좋은 구간
// https://www.acmicpc.net/problem/1059
// 풀이 : hogumachu

import Foundation

func solution() {
    let _ = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = Int(readLine()!)!
    let sortedArray = arr.sorted()
    var result = 0
    var low = 0
    var high = 0

    for value in sortedArray {
        if value < n {
            low = value
        } else if value == n {
            result = 0
            break
        } else {
            high = value
            break
        }
    }
    if low+1 <= high-2 {
        for i in low+1...high-2 {
            for j in i+1...high-1 {
                if i <= n && n <= j {
                    result += 1
                }
            }
        }
    }
    print(result)
}

solution()
