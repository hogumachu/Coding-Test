// 출처 : 프로그래머스 2021 카카오 채용연계형 인턴십 거리두기 확인하기
// https://programmers.co.kr/learn/courses/30/lessons/81302
// 풀이 : hogumachu

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var result = Array(repeating: 1, count: 5)
    for i in 0..<5 {
        var arr: [[String]] = Array(repeating: [], count: 5)
        for j in 0..<5 {
            arr[j] = places[i][j].map { String($0) }
        }

        for x in 0..<5 {
            for y in 0..<5 {
                if arr[x][y] == "P", !visit(arr, x, y) {
                    result[i] = 0
                    break
                }
            }
        }
    }

    return result
}

func visit(_ array: [[String]], _ x: Int, _ y: Int) -> Bool {
//    상
    let moveXUp = [-1, -1, -2]
    let moveYUp = [-1, 1, 0]

    if x - 1 >= 0 {
        if array[x - 1][y] == "P" {
            return false
        } else if array[x - 1][y] == "O" {
            for i in 0..<moveXUp.count {
                if x + moveXUp[i] >= 0 && y + moveYUp[i] >= 0 && y + moveYUp[i] < 5, array[x + moveXUp[i]][y + moveYUp[i]] == "P" {
                    return false
                }
            }
        }
    }

//    하
    let moveXDown = [1, 1, 2]
    let moveYDown = [-1, 1, 0]

    if x + 1 < 5 {
        if array[x + 1][y] == "P" {
            return false
        } else if array[x + 1][y] == "O" {
            for i in 0..<moveXDown.count {
                if x + moveXDown[i] < 5 && y + moveYDown[i] >= 0 && y + moveYDown[i] < 5 , array[x + moveXDown[i]][y + moveYDown[i]] == "P" {
                    return false
                }
            }
        }
    }

//    좌
    let moveXLeft = [-1, 1, 0]
    let moveYLeft = [-1, -1, -2]

    if y - 1 >= 0 {
        if array[x][y - 1] == "P" {
            return false
        } else if array[x][y - 1] == "O" {
            for i in 0..<moveXLeft.count {
                if x + moveXLeft[i] >= 0 && x + moveXLeft[i] < 5 && y + moveYLeft[i] >= 0 , array[x + moveXLeft[i]][y + moveYLeft[i]] == "P" {
                    return false
                }
            }
        }
    }

//    우
    let moveXRight = [-1, 1, 0]
    let moveYRight = [1, 1, 2]
    if y + 1 < 5 {
        if array[x][y + 1] == "P" {
            return false
        } else if array[x][y + 1] == "O" {
            for i in 0..<moveXRight.count {
                if x + moveXRight[i] >= 0 && x + moveXRight[i] < 5 && y + moveYRight[i] < 5, array[x + moveXRight[i]][y + moveYRight[i]] == "P" {
                    return false
                }
            }
        }
    }

    return true
}
