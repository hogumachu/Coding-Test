// 출처 : 프로그래머스 2020 KAKAO BLIND RECRUITMENT 자물쇠와 열쇠
// https://programmers.co.kr/learn/courses/30/lessons/60059
// 풀이 : hogumachu

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let lockPath = getPath(lock, 0)

    let firstRotate = rotate(key)
    let secondRotate = rotate(firstRotate)
    let thirdRotate = rotate(secondRotate)

    let firstKeyPath = getPath(key, 1)
    let secondKeyPath = getPath(firstRotate, 1)
    let thirdKeyPath = getPath(secondRotate, 1)
    let fourthKeyPath = getPath(thirdRotate, 1)

    var result = false
    let n = max(key.count, lock.count)
    for i in -n + 1 ..< n {
        for j in -n + 1 ..< n {
            if result {
                break
            }
            let first = getMove(firstKeyPath, n, i, j)
            let second = getMove(secondKeyPath, n, i, j)
            let third = getMove(thirdKeyPath, n, i, j)
            let fourth = getMove(fourthKeyPath, n, i, j)

            if first.count == lockPath.count {
                var firstBool = true

                for i in 0..<lockPath.count {
                    if first[i].0 == lockPath[i].0 && first[i].1 == lockPath[i].1 {
                        continue
                    } else {
                        firstBool = false
                        break
                    }
                }

                if firstBool {
                    result = true
                    break
                }
            }

            if second.count == lockPath.count {
                var secondBool = true

                for i in 0..<lockPath.count {
                    if second[i].0 == lockPath[i].0 && second[i].1 == lockPath[i].1 {
                        continue
                    } else {
                        secondBool = false
                        break
                    }
                }

                if secondBool {
                    result = true
                    break
                }
            }

            if third.count == lockPath.count {
                var thirdBool = true

                for i in 0..<lockPath.count {
                    if third[i].0 == lockPath[i].0 && third[i].1 == lockPath[i].1 {
                        continue
                    } else {
                        thirdBool = false
                        break
                    }
                }

                if thirdBool {
                    result = true
                    break
                }
            }

            if fourth.count == lockPath.count {
                var fourthBool = true

                for i in 0..<lockPath.count {
                    if fourth[i].0 == lockPath[i].0 && fourth[i].1 == lockPath[i].1 {
                        continue
                    } else {
                        fourthBool = false
                        break
                    }
                }

                if fourthBool {
                    result = true
                    break
                }
            }
        }

    }
    return result
}

func getPath(_ table: [[Int]], _ k: Int) -> [(Int, Int)] {
    var paths: [(Int, Int)] = []
    let n = table.count

    for i in 0..<n {
        for j in 0..<n {
            if table[i][j] == k {
                paths.append((i, j))
            }
        }
    }

    paths.sort {
        if $0.0 == $1.0 {
            return $0.1 < $1.1
        } else {
            return $0.0 < $1.0
        }
    }

    return paths
}

func rotate(_ table: [[Int]]) -> [[Int]] {
    var newTable = table
    let n = table.count

    for i in 0..<n {
        for j in 0..<n {
            newTable[i][j] = table[n - j - 1][i]
        }
    }
    return newTable
}

func getMove(_ paths: [(Int, Int)], _ n: Int, _ x: Int, _ y: Int) -> [(Int, Int)] {
    var newPath: [(Int, Int)] = []

    for path in paths {
        if path.0 + x >= 0 && path.0 + x < n && path.1 + y >= 0 && path.1 + y < n {
            newPath.append((path.0 + x, path.1 + y))
        }
    }

    newPath.sort {
        if $0.0 == $1.0 {
            return $0.1 < $1.1
        } else {
            return $0.0 < $1.0
        }
    }
    return newPath
}
