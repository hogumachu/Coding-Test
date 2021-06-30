// 출처 : 백준 N-Queen
// https://www.acmicpc.net/problem/9663
// 풀이 : hogumachu

let n = Int(readLine()!)!
let queen: [Bool] = Array(repeating: false, count: n * n)
var result = 0

if n > 1 {
    for i in 0..<n {
        findQueen(n, makeQueen(i, queen), 1)
    }
    print(result)
} else {
    print(1)
}



func findQueen(_ now: Int, _ chess: [Bool], _ queenCounting: Int) {
    let layer = ((now / n) + 1) * n
    for i in now..<layer {
        if !chess[i] {
            if queenCounting == n - 1 {
                result += 1
                return
            } else {
                findQueen(layer, makeQueen(i, chess), queenCounting + 1)
            }

        }
    }


}


func makeQueen(_ now: Int, _ chess: [Bool]) -> [Bool] {
    var newChess = chess
    newChess[now] = true

    // x축 증가 이동
    for i in stride(from: now + n, through: n * n - 1, by: n) {
        newChess[i] = true
    }
    // x축 1증가, y축 1증가 (우측 하단으로 이동)
    var level = (now / n) + 1
    for i in stride(from: now + n + 1, through: n * n - 1, by: n + 1) {
        if i / n != level {
            break
        }
        level += 1
        newChess[i] = true
    }
    // x축 1증가 y축 1감소 (좌측 하단으로 이동)
    var level3 = (now / n) + 1
    for i in stride(from: now + n - 1, through: n * n - 1, by: n - 1) {
        if i / n != level3 {
            break
        }
        level3 += 1
        newChess[i] = true
    }
    return newChess
}
