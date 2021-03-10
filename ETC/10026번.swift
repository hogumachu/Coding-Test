// 출처 : 백준 적록색약
// https://www.acmicpc.net/problem/10026
// 풀이 : hogumachu
// 매우 비효율적으로 푼 느낌
// O(n^2) 으로 했는데 조건이 후해서 그런가 맞았음


import Foundation

let n = Int(readLine()!)!
var RGB = Array(repeating: Array(repeating: ("", false), count: n), count: n)
var weakRGB = Array(repeating: Array(repeating: ("", false), count: n), count: n)
var RGBresult = 0
var weakRGBresult = 0

for i in 0..<n {
    let read = readLine()!.map{String($0)}
    for j in 0..<n {
        RGB[i][j] = (read[j], false)
        if read[j] == "G" {
            weakRGB[i][j] = ("R", false)
        } else {
            weakRGB[i][j] = (read[j], false)
        }

    }
}

func getColor( _ color: String, _ x: Int, _ y: Int) -> Void {
    RGB[x][y].1 = true
    if x-1 >= 0 {
        if RGB[x-1][y].1 == false {
            if RGB[x-1][y].0 == color {
                getColor(color, x-1, y)
            }
        }
    }
    if x+1 < n {
        if RGB[x+1][y].1 == false {
            if RGB[x+1][y].0 == color {
                getColor(color, x+1, y)
            }
        }
    }
    if y-1 >= 0 {
        if RGB[x][y-1].1 == false {
            if RGB[x][y-1].0 == color {
                getColor(color, x, y-1)
            }
        }
    }
    if y+1 < n {
        if RGB[x][y+1].1 == false {
            if RGB[x][y+1].0 == color {
                getColor(color, x, y+1)
            }
        }
    }
}

func getWeakColor( _ color: String, _ x: Int, _ y: Int) -> Void {
    weakRGB[x][y].1 = true
    if x-1 >= 0 {
        if weakRGB[x-1][y].1 == false {
            if weakRGB[x-1][y].0 == color {
                getWeakColor(color, x-1, y)
            }
        }
    }
    if x+1 < n {
        if weakRGB[x+1][y].1 == false {
            if weakRGB[x+1][y].0 == color {
                getWeakColor(color, x+1, y)
            }
        }
    }
    if y-1 >= 0 {
        if weakRGB[x][y-1].1 == false {
            if weakRGB[x][y-1].0 == color {
                getWeakColor(color, x, y-1)
            }
        }
    }
    if y+1 < n {
        if weakRGB[x][y+1].1 == false {
            if weakRGB[x][y+1].0 == color {
                getWeakColor(color, x, y+1)
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if RGB[i][j].1 == false {
            getColor(RGB[i][j].0, i, j)
            RGBresult += 1
        }
        if weakRGB[i][j].1 == false {
            getWeakColor(weakRGB[i][j].0, i, j)
            weakRGBresult += 1
        }

    }
}
print(RGBresult, weakRGBresult)
