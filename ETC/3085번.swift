// 출처 : 백준 사탕 게임
// https://www.acmicpc.net/problem/3085
// 풀이 : hogumachu

let n = Int(readLine()!)!
var bomboni: [[Character]] = Array(repeating: [], count: n)
var result = 0
for i in 0..<n {
    let input = readLine()!.map{$0}
    bomboni[i] = input
}

for i in 0..<n {
    for j in 0..<n {
        let right = rightswap(bomboni, i, j)
        let down = downswap(bomboni, i, j)
        let no = noswap(bomboni, i, j)
        result = result < right ? right : result
        result = result < down ? down : result
        result = result < no ? no : result
    }
}
print(result)


func rightswap(_ arr: [[Character]], _ x: Int, _ y: Int) -> Int {
    var arr = arr
    var maxi = 0
    if y + 1 < n {
        arr[x].swapAt(y, y+1)
        for i in 0..<n {
            let firstSelect = arr[i][y]
            let secondSelect = arr[i][y+1]
            let thirdSelect = arr[x][i]
            var first = 0
            var second = 0
            var third = 0
            for j in i..<n {
                if firstSelect == arr[j][y] {
                    first += 1
                } else {
                    break
                }
            }
            for j in i..<n {
                if secondSelect == arr[j][y+1] {
                    second += 1
                } else {
                    break
                }
            }
            for j in i..<n {
                if thirdSelect == arr[x][j] {
                    third += 1
                } else {
                    break
                }
            }
            maxi = maxi < first ? first : maxi
            maxi = maxi < second ? second : maxi
            maxi = maxi < third ? third : maxi
        }
    }
    return maxi
}
func downswap(_ arr: [[Character]], _ x: Int, _ y: Int) -> Int {
    var arr = arr
    var maxi = 0
    if x + 1 < n {
        let s = arr[x][y]
        arr[x][y] = arr[x+1][y]
        arr[x+1][y] = s

        for i in 0..<n {
            let firstSelect = arr[x][i]
            let secondSelect = arr[x+1][i]
            let thirdSelect = arr[i][y]
            var first = 0
            var second = 0
            var third = 0
            for j in i..<n {
                if firstSelect == arr[x][j] {
                    first += 1
                } else {
                    break
                }
            }
            for j in i..<n {
                if secondSelect == arr[x+1][j] {
                    second += 1
                } else {
                    break
                }
            }
            for j in i..<n {
                if thirdSelect == arr[j][y] {
                    third += 1
                } else {
                    break
                }
            }
            maxi = maxi < first ? first : maxi
            maxi = maxi < second ? second : maxi
            maxi = maxi < third ? third : maxi
        }
    }
    return maxi
}

func noswap(_ arr: [[Character]], _ x: Int, _ y: Int) -> Int {
    var maxi = 0
    for i in 0..<n {
        let select = arr[i][y]
        var counting = 0
        for j in i..<n {
            if select == arr[j][y] {
                counting += 1
            } else {
                break
            }
        }
        maxi = maxi < counting ? counting : maxi
    }

    for i in 0..<n {
        let select = arr[x][i]
        var counting = 0
        for j in i..<n {
            if select == arr[x][j] {
                counting += 1
            } else {
                break
            }
        }

        maxi = maxi < counting ? counting : maxi
    }

    return maxi
}
