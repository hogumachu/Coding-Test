// 출처 : 백준 이중 우선순위 큐
// https://www.acmicpc.net/problem/7662
// 풀이 : hogumachu

// swift로 못푸는 문제라서 Python으로 제출
// 시간 초과 뜸!!!

import Foundation

class dualPriorityQueue {
    var queue: [Int] = []

    func action( _ order: String, _ num: Int) -> Void {
        switch order {
        case "I":
            self.queue.append(num)
        case "D":
            if num == 1 {
                if queue.count != 0 {
                    queue.remove(at: queue.firstIndex(of: queue.max()!)!)
                }
            } else if num == -1 {
                if queue.count != 0 {
                    queue.remove(at: queue.firstIndex(of: queue.min()!)!)
                }
            }
        default:
            break
        }
    }

    func lastAction() -> Void {
        if queue.count == 0 {
            print("EMPTY")
        } else {
            print("\(queue.max()!) \(queue.min()!)")
        }
    }
}

let T = Int(readLine()!)!
var DPQ: [dualPriorityQueue] = []

for i in 0..<T {
    DPQ.append(dualPriorityQueue.init())
    let repeatingNum = Int(readLine()!)!

    for _ in 1...repeatingNum {
        let read = readLine()!.split(separator: " ").map{$0}
        DPQ[i].action(String(read[0]), Int(read[1])!)
    }

}


for dpq in DPQ {
    dpq.lastAction()
}
