// 출처 : 백준 프린터 큐
// https://www.acmicpc.net/problem/1966
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!

for _ in 1...input {
    var queue: [(Int, Int)] = []
    var count = 1
    let inputTwo = readLine()!.split(separator: " ").map{Int(String($0))!}
    let compare = inputTwo[1]
    let inputThree = readLine()!.split(separator: " ").map{Int(String($0))!}
    var sorted = inputThree.sorted(by: >)
    for i in 0..<inputThree.count {
        queue.append((i, inputThree[i]))

    }
    while queue.count != 0 {
        if queue.first!.1 == sorted.first! {
            if queue.first!.0 == compare {
                print(count)
                break
            } else {
                queue.removeFirst()
                sorted.removeFirst()
                count += 1
            }
        } else {
            let temp = queue.first!
            queue.removeFirst()
            queue.append(temp)
        }
    }

}
