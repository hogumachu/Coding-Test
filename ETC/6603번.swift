// 출처 : 백준 로또
// https://www.acmicpc.net/problem/6603
// 풀이 : hogumachu

import Foundation

func solution() {
    while true {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        if input[0] == 0 {
            break
        } else {
            let k = input[0]

            func visited(_ printStr: String, _ index: Int, _ count: Int) -> Void {
                if count == 6 {
                    print(printStr)
                } else {
                    if index+1 > k {
                        return
                    }
                    for i in index+1...k {
                        visited(printStr + "\(input[i]) ", i, count+1)
                    }
                }
            }
            for i in 1...k {
                visited("\(input[i]) ", i, 1)
            }
            print()
        }
    }
}

solution()
