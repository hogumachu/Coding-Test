// 출처 : 백준 톱니바퀴
// https://www.acmicpc.net/problem/14891
// 풀이 : hogumachu

import Foundation

var gears: [Gear] = []
var result = 0

for _ in 0..<4 {
    let gear = readLine()!.map{ Int(String($0))! }
    gears.append(Gear(info: gear))
}

let k = Int(readLine()!)!

for _ in 0..<k {
    let order = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    var rotate: [Rotate] = Array(repeating: .none, count: 4)

    switch order[1] {
    // 시계
    case 1:
        rotate[order[0] - 1] = .right
    // 반시계
    case -1:
        rotate[order[0] - 1] = .left
    default:
        continue
    }

    if order[0] - 2 >= 0 {
        for i in stride(from: order[0] - 2, through: 0, by: -1) {
            if gears[i].right() == gears[i + 1].left() {
                break
            } else {
                switch rotate[i + 1] {
                case .right:
                    rotate[i] = .left
                case .left:
                    rotate[i] = .right
                case .none:
                    break
                }
            }
        }
    }

    if order[0] < 4 {
        for i in order[0] ..< 4 {
            if gears[i].left() == gears[i - 1].right() {
                break
            } else {
                switch rotate[i - 1] {
                case .right:
                    rotate[i] = .left
                case .left:
                    rotate[i] = .right
                case .none:
                    break
                }
            }
        }
    }
    for i in 0..<4 {
        switch rotate[i] {
        case .right:
            gears[i].moveRight()
        case .left:
            gears[i].moveLeft()
        case .none:
            continue
        }
    }
}

for i in 0..<4 {
    result += gears[i].top() * Int(pow(2.0, Double(i)))
}

print(result)

enum Rotate {
    case left
    case right
    case none
}

struct Gear {
    let info: [Int]
    private var topIndex: Int
    private var rightIndex: Int
    private var leftIndex: Int

    init(info: [Int]) {
        self.info = info
        self.topIndex = 0
        self.rightIndex = 2
        self.leftIndex = 6
    }

    mutating func moveRight() {
        // 전체적으로 -1
        self.topIndex = topIndex - 1 == -1 ? 7 : topIndex - 1
        self.rightIndex = rightIndex - 1 == -1 ? 7 : rightIndex - 1
        self.leftIndex = leftIndex - 1 == -1 ? 7 : leftIndex - 1

    }

    mutating func moveLeft() {
        // 전체적으로 +1
        self.topIndex = topIndex + 1 == 8 ? 0 : topIndex + 1
        self.rightIndex = rightIndex + 1 == 8 ? 0 : rightIndex + 1
        self.leftIndex = leftIndex + 1 == 8 ? 0 : leftIndex + 1
    }

    func top() -> Int {
        return info[topIndex]
    }

    func right() -> Int {
        return info[rightIndex]
    }

    func left() -> Int {
        return info[leftIndex]
    }
}
