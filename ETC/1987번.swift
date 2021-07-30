// 출처 : 백준 알파벳
// https://www.acmicpc.net/problem/1987
// 풀이 : hogumachu
// visted 로 해서 방문을 체크했는데 시간 초과 났음
// 비트마스크 아니면 시간초과 해결 불가능 한듯
// dfs 안에 moveX 와 moveY 를 넣고 돌렸는데 시간 초과 났음
// 밖에 선언해주니 해결되었음.

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
var values: [[Int]] = Array(repeating: [], count: rc[0])
let moveX = [-1, 0, 1, 0]
let moveY = [0, 1, 0, -1]
var result = 0

for i in 0..<rc[0] {
    let value = readLine()!.map { Int($0.asciiValue!) - 65 }
    values[i] = value
}

dfs(0, 0, 1, 1 << values[0][0])

print(result)

func dfs(_ x: Int, _ y: Int, _ count: Int, _ bit: Int) {

    result = result > count ? result : count

    for i in 0..<moveX.count {
        let movedX = x + moveX[i]
        let movedY = y + moveY[i]

        if movedX < 0 || movedX >= rc[0] || movedY < 0 || movedY >= rc[1] {
            continue
        }

        let next = 1 << values[movedX][movedY]

        if bit & next == 0 {
            dfs(movedX, movedY, count + 1, bit | next)
        }
    }
}
