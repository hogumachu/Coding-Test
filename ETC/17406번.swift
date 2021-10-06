// 출처 : 백준 배열 돌리기 4
// https://www.acmicpc.net/problem/17406
// 풀이 : hogumachu

let size = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var originArr: [[Int]] = Array(repeating: [], count: size[0])
var orders: [[Int]] = []
var result = Int.max

for i in 0..<size[0] {
    originArr[i] = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
}

for _ in 0..<size[2] {
    let order = readLine()!.split { $0 == " " }.map{ Int(String($0))! }
    orders.append(order)
}

var arr = originArr

for i in 0..<orders.count {
    visit([i])
}

func visit(_ indices: [Int]) {
    if indices.count == orders.count {
        arr = originArr

        for index in indices {
            let ord = orders[index]

            for i in 1...ord[2] {
                rotate(ord[0], ord[1], i)
            }
        }

        for i in 0..<arr.count {
            result = min(result, arr[i].reduce(0, +))
        }
        return
    }

    for i in 0..<orders.count {
        if !indices.contains(i) {
            visit(indices + [i])
        }
    }
}

print(result)

func rotate(_ r: Int, _ c: Int, _ s: Int) {
    let edges = [arr[r - s - 1][c - s - 1],
                 arr[r - s - 1][c + s - 1],
                 arr[r + s - 1][c - s - 1],
                 arr[r + s - 1][c + s - 1]
    ]

    // up
    for i in stride(from: c + s - 2, through: c - s - 1, by: -1) {
        arr[r - s - 1][i + 1] = arr[r - s - 1][i]
    }

    // right
    for i in stride(from: r + s - 2, through: r - s - 1, by: -1) {
        arr[i + 1][c + s - 1] = arr[i][c + s - 1]
    }

    // down
    for i in c - s ... c + s - 1 {
        arr[r + s - 1][i - 1] = arr[r + s - 1][i]
    }

    // left
    for i in r - s ... r + s - 1 {
        arr[i - 1][c - s - 1] = arr[i][c - s - 1]
    }



    arr[r - s - 1][c - s] = edges[0]
    arr[r - s][c + s - 1] = edges[1]
    arr[r + s - 2][c - s - 1] = edges[2]
    arr[r + s - 1][c + s - 2] = edges[3]
}
