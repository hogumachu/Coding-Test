// 출처 : 백준 A -> B
// https://www.acmicpc.net/problem/16953
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = input[0], b = input[1]
    var queue: [(Int, Int, Int)] = []
    var index = 0
    var result = 0
    var findResult = false
    queue.append((a,b,1))

    func AtoB( _ x: Int, _ y: Int, _ count: Int) -> Void {
        if x == y {
            result = count
            findResult = true
            return
        } else if x > y {
            return
        } else {
            x*10+1 > y ? nil : queue.append((x*10+1, y, count+1))
            x*2 > y ? nil : queue.append((x*2, y, count+1))
        }
    }
    while queue.count != index && !findResult {
        let dequeue = queue[index]
        index += 1
        AtoB(dequeue.0, dequeue.1, dequeue.2)
    }
    findResult == true ? print(result) : print(-1)
}

solution()
