// 출처 : 백준 단지번호붙이기
// https://www.acmicpc.net/problem/2667
// 풀이 : hogumachu
// 제한이 쉬워서 단순한 반복문으로 구현
// 집의 수를 오름차순으로 정렬해야 하는 것을 읽지 못해서 헛고생 했음
// -> 문제 조건을 잘 읽자

import Foundation

let n = Int(readLine()!)!
var result: [Int] = []
var count = 0
var houseCount = Array(repeating: 0, count: 25 * 25 + 1)
var house: [[(Int,Bool)]] = Array(repeating: Array(repeating: (0, false), count: n), count: n)

for i in 0..<n {
    let read = readLine()!.map{Int(String($0))!}
    for j in 0..<n {
        house[i][j] = (read[j], false)
    }
}

func findHouse( _ count: Int, _ x: Int, _ y: Int)-> Void {
    if house[x][y] == (1, false) {
        house[x][y].0 = count
        house[x][y].1 = true
        houseCount[count] += 1
        if x-1 >= 0 {
            if house[x-1][y] == (1, false) {
                findHouse(count, x-1, y)
            }
        }
        if x+1 < n {
            if house[x+1][y] == (1, false) {
                findHouse(count, x+1, y)
            }
        }
        if y-1 >= 0 {
            if house[x][y-1] == (1, false) {
                findHouse(count, x, y-1)
            }
        }
        if y+1 < n {
            if house[x][y+1] == (1, false) {
                findHouse(count, x, y+1)
            }
        }
    }
}
for i in 0..<n {
    for j in 0..<n {
        if house[i][j].0 == 1, house[i][j].1 == false {
            count += 1
            findHouse(count, i, j)
        }
    }
}


for i in 1..<houseCount.count {
    if houseCount[i] == 0 {
        break
    } else {
        result.append(houseCount[i])
    }
}

result.sort(by: <)

print(count)

for num in result {
    print(num)
}
