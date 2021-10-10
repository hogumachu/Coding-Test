// 출처 : 백준 주사위 굴리기
// https://www.acmicpc.net/problem/14499
// 풀이 : hogumachu

let dice = Dice()

let mnxyk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let m = mnxyk[0], n = mnxyk[1]
var x = mnxyk[2], y = mnxyk[3]

var location: [[Int]] = Array(repeating: [], count: m)

for i in 0..<m {
    let row = readLine()!.split { $0 == " " }.map {Int(String($0))! }
    location[i] = row
}

let orders = readLine()!.split { $0 == " " }.map{ Int(String($0))! }

orders.forEach { order in
    switch order {
    case 1:
        if y + 1 < n {
            location[x][y + 1] = dice.move(order, location[x][y + 1])
            y += 1
        }
    case 2:
        if y - 1 >= 0 {
            location[x][y - 1] = dice.move(order, location[x][y - 1])
            y -= 1
        }
    case 3:
        if x - 1 >= 0 {
            location[x - 1][y] = dice.move(order, location[x - 1][y])
            x -= 1
        }
    case 4:
        if x + 1 < m {
            location[x + 1][y] = dice.move(order, location[x + 1][y])
            x += 1
        }
    default:
        break
    }
}


class Dice {
    var top: Int = 0
    var bottom: Int = 0
    var left: Int = 0
    var right: Int = 0
    var up: Int = 0
    var down: Int = 0

    func move(_ order: Int, _ value: Int) -> Int {
        let temp = (top: top,
                    bottom: bottom,
                    left: left,
                    right: right,
                    up: up,
                    down: down)

        switch order {
        case 1:
            top = temp.left
            left = temp.bottom
            right = temp.top
            bottom = temp.right
        case 2:
            top = temp.right
            left = temp.top
            right = temp.bottom
            bottom = temp.left
        case 3:
            up = temp.top
            top = temp.down
            down = temp.bottom
            bottom = temp.up
        case 4:
            up = temp.bottom
            top = temp.up
            down = temp.top
            bottom = temp.down

        default:
            return value
        }

        print(top)

        if value == 0 {
            return self.bottom
        } else {
            bottom = value
            return 0
        }


    }
}
