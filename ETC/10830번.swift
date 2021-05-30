// 출처 : 백준 행렬 제곱
// https://www.acmicpc.net/problem/10830
// 풀이 : hogumachu
// 2 1
// 1000 1000 -> 0 0
// 1000 1000    0 0 으로 나오는 경우도 생각


import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], b = input[1]
    var originalMatrix: [[Int]] = Array(repeating: [], count: n)

    for i in 0..<n {
        originalMatrix[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
    }
    var multedMatrix = originalMatrix
    var multCount = 1
    var saveMultedMatrix: [[[Int]]] = []
    var saveMultedCount: [Int] = []
    func multMatrix() -> Void {
        if multCount == b {
            for i in 0..<n {
                var printMatrix = ""
                for j in 0..<n {
                    printMatrix += "\(multedMatrix[i][j]%1000) "
                }
                print(printMatrix)
                printMatrix = ""
            }
            return
        }

        if multCount * 2 <= b {
            var returnMatrix = Array(repeating: Array(repeating: 0, count: n), count: n)
            for i in 0..<n {
                for j in 0..<n {
                    for k in 0..<n {
                        returnMatrix[i][j] += multedMatrix[i][k] * multedMatrix[k][j]
                    }
                    returnMatrix[i][j] %= 1000
                }
            }
            multedMatrix = returnMatrix
            multCount *= 2
            saveMultedMatrix.append(multedMatrix)
            saveMultedCount.append(multCount)

            multMatrix()
            return
        } else {
            var select = -1
            for a in 0..<saveMultedCount.count {
                if multCount + saveMultedCount[a] <= b {
                    select = a
                }
            }
            if select == -1 {
                var returnMatrix = Array(repeating: Array(repeating: 0, count: n), count: n)
                for i in 0..<n {
                    for j in 0..<n {
                        for k in 0..<n {
                            returnMatrix[i][j] += multedMatrix[i][k] * originalMatrix[k][j]
                        }
                        returnMatrix[i][j] %= 1000
                    }
                }
                multedMatrix = returnMatrix
                multCount += 1
                multMatrix()
                return
            } else {
                var returnMatrix = Array(repeating: Array(repeating: 0, count: n), count: n)
                for i in 0..<n {
                    for j in 0..<n {
                        for k in 0..<n {
                            returnMatrix[i][j] += multedMatrix[i][k] * saveMultedMatrix[select][k][j]
                        }
                        returnMatrix[i][j] %= 1000
                    }
                }
                multedMatrix = returnMatrix
                multCount += saveMultedCount[select]
                saveMultedMatrix.append(multedMatrix)
                saveMultedCount.append(multCount)
                multMatrix()
                return
            }
        }

    }
    multMatrix()
}

solution()
