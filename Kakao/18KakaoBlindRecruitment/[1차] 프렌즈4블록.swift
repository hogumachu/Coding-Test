// 출처 : 프로그래머스 2018 KAKAO BLIND RECRUITMENT [1차] 프렌즈4블록
// https://programmers.co.kr/learn/courses/30/lessons/17679
// 풀이 : hogumachu

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var table: [[Character]] = Array(repeating: [], count: m)
    var queue: [(Int, Int)] = []
    var queueIndex = -1
    var result = 0
    for i in 0..<m {
        for str in board[i] {
            for ch in String(str) {
                table[i].append(ch)
            }
        }
    }

    func blockRemove() -> Void {
        for i in 0..<m {
            for j in 0..<n {
                if table[m-i-1][j] == Character("x") && m-i-2 >= 0 {
                    for k in 1...m-i-1 {
                        if table[m-i-1-k][j] != Character("x") {
                            table[m-i-1][j] = table[m-i-1 - k][j]
                            table[m-i-1-k][j] = Character("x")
                            break
                        }
                    }
                }
            }
        }
    }

    while queue.count > queueIndex {
        if queueIndex != -1 {
            for i in queueIndex..<queue.count {
                table[queue[i].0][queue[i].1] = Character("x")
            }
            blockRemove()
            queueIndex = queue.count - 1
        }
        for i in 0..<m {
            for j in 0..<n {
                if table[i][j] != Character("x") {
                    if i+1 < m && j+1 < n {
                        if table[i][j] == table[i+1][j] && table[i][j] == table[i][j+1] && table[i][j] == table[i+1][j+1] {
                            queue.append(contentsOf: [(i,j), (i+1,j), (i,j+1), (i+1, j+1)])
                        }
                    }
                }
            }
        }
        queueIndex += 1
    }
    for i in 0..<m {
        for j in 0..<n {
            if table[i][j] == Character("x") {
                result += 1
            }
        }
    }
    return result
}
