// 출처 : 백준 선분 교차 2
// https://www.acmicpc.net/problem/17387
// 풀이 : hogumachu
// 참고 : https://jason9319.tistory.com/358

let xy12 = readLine()!.split(separator: " ").map { Int(String($0))! }
let xy34 = readLine()!.split(separator: " ").map { Int(String($0))! }

print(isCross((xy12[0], xy12[1]), (xy12[2], xy12[3]), (xy34[0], xy34[1]), (xy34[2], xy34[3])) == true ? "1" : "0")

func ccw(_ a: (Int, Int), _ b: (Int, Int), _ c: (Int, Int)) -> Int {
    var op = a.0 * b.1 + b.0 * c.1 + c.0 * a.1
    op -= a.1 * b.0 + b.1 * c.0 + c.1 * a.0

    if op > 0 {
        return 1
    } else if op == 0 {
        return 0
    } else {
        return -1
    }
}

func isCross(_ xy1: (Int, Int), _ xy2: (Int, Int), _ xy3: (Int, Int), _ xy4: (Int, Int)) -> Bool {
    var a = xy1, b = xy2, c = xy3, d = xy4
    let first = ccw(xy1, xy2, xy3) * ccw(xy1, xy2, xy4)
    let second = ccw(xy3, xy4, xy1) * ccw(xy3, xy4, xy2)

    if first == 0 && second == 0 {
        if a > b {
            swap(&a, &b)
        }
        if c > d {
            swap(&c, &d)
        }
        return c <= b && a <= d
    }
    return first <= 0 && second <= 0
}
