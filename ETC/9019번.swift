// 시간초과 !!!! 다시 풀기
// L과 R를 계산할 때 시간 초과가 나는 듯 ?

// 출처 : 백준 DSLR
// https://www.acmicpc.net/problem/9019
// 풀이 : hogumachu

import Foundation

func solution() {
    let t = Int(readLine()!)!
    var queue: [(Int, String, Int)] = []
    var counting: [Int] = Array(repeating: 1000000, count: 10000)
    let newCounting = counting
    let newQueue: [(Int, String, Int)] = []
    var printResult = ""
    func DSLR(_ start: Int, _ end: Int, _ result: String, _ count: Int) -> Void {
        let D = start * 2 > 9999 ? start * 2 % 10000 : start * 2
        let S = start == 0 ? 9999 : start-1

        if D == end {
            printResult = result+"D"
            return
        } else if counting[D] > count + 1{
            counting[D] = count + 1
            queue.append((D, result+"D", count + 1))
        }

        if S == end {
            printResult = result+"S"
            return
        } else if counting[S] > count + 1 {
            counting[S] = count + 1
            queue.append((S, result+"S", count + 1))
        }

        let L = start % 1000 * 10 + start / 1000
        let R = start % 10 * 1000 + start / 10

        if L == end {
            printResult = result+"L"
            return
        } else if counting[L] > count + 1{
            counting[L] = count + 1
            queue.append((L, result+"L", count + 1))
        }

        if R == end {
            printResult = result+"R"
            return
        } else if counting[R] > count + 1{
            counting[R] = count + 1
            queue.append((R, result+"R", count + 1))
        }
    }

    for _ in 0..<t {
        let values = readLine()!.split(separator: " ").map{Int(String($0))!}
        queue.append((values[0], "", values[1]))
        while queue.isEmpty == false && printResult == "" {
            let first = queue.removeFirst()
            DSLR(first.0, values[1], first.1, first.1.count)
        }
        print(printResult)
        printResult = ""
        queue = newQueue
        counting = newCounting
    }
}

solution()
