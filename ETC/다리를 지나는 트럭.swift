// 출처 : 프로그래머스 스택/큐 다리를 지나는 트럭
// https://programmers.co.kr/learn/courses/30/lessons/42583
// 풀이 : hogumachu
// swift 에도 FIFO 가 되게 해주세요.
// queue 만들어주세요..
// 어케 이게 1점임

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
   var queue = Queue<Int>()
    var result = 0
    var now = weight
    var index = 0

    for _ in 0..<bridge_length {
        queue.enqueue(0)
    }

    while index < truck_weights.count {
        now += queue.dequeue()!
        if now - truck_weights[index] >= 0 {
            queue.enqueue(truck_weights[index])
            now -= truck_weights[index]
            index += 1
        } else {
            queue.enqueue(0)
        }
        result += 1
    }

    for i in stride(from: queue.count - 1, through: queue.head, by: -1) {
        guard let value = queue.queue[i] else {
            break
        }
        if value != 0 {
            result += i - queue.head + 1
            break
        }

    }
    return result
}

struct Queue<T> {
    var queue: [T?] = []
    var head: Int = 0

    public var count: Int {
        return queue.count
    }

    public var isEmpty: Bool {
        return queue.isEmpty
    }

    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }

    public mutating func dequeue() -> T? {
        guard head <= queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1

        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}
