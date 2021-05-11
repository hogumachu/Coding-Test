// 출처 : 백준 DSLR
// https://www.acmicpc.net/problem/9019
// 풀이 : hogumachu
// removeFirst를 여러 번 사용하니 시간 초과가 뜸
// 추가적으로 String으로 결과를 계속 보내는 것 보다
// Int로 해서 보내는 게 더 빠름

import Foundation

func solution() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        var visited: [Bool] = Array(repeating: false, count: 10000)
        var queue: [(Int, Int)] = []
        var printResult = ""
        var index = 0
        let values = readLine()!.split(separator: " ").map{Int(String($0))!}
        queue.append((values[0], 0))
        visited[values[0]] = true
        while true {
            if printResult != "" {
                break
            }
            let select = queue[index]
            let start = select.0, end = values[1], result = select.1
            index += 1
            if start == end {
                for i in String(result) {
                    switch i {
                    case "1":
                        printResult += "D"
                    case "2":
                        printResult += "S"
                    case "3":
                        printResult += "L"
                    case "4":
                        printResult += "R"
                    default:
                        break
                    }
                }
                break
            } else {
                let D = start * 2 % 10000
                let S = start == 0 ? 9999 : start-1
                let L = (start % 1000) * 10 + start / 1000
                let R = (start % 10) * 1000 + start / 10

                if visited[D] == false {
                    visited[D] = true
                    queue.append((D, result*10+1))
                }

                if visited[S] == false {
                    visited[S] = true
                    queue.append((S, result*10+2))
                }

                if visited[L] == false {
                    visited[L] = true
                    queue.append((L, result*10+3))
                }

                if visited[R] == false {
                    visited[R] = true
                    queue.append((R, result*10+4))
                }
            }
        }
        print(printResult)
    }
}

solution()
