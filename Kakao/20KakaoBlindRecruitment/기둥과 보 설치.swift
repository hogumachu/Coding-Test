// 출처 : 프로그래머스 2020 KAKAO BLIND RECRUITMENT 기둥과 보 설치
// https://programmers.co.kr/learn/courses/30/lessons/60061
// 풀이 : hogumachu
// result 에 path 를 담아서 contains 로 확인했는데 시간 초과가 났음
// 그래서 기둥이랑 보를 확인하기 위해 up 과 right 를 추가하여 비교함

import Foundation

func solution(_ n: Int, _ build_frame:[[Int]]) -> [[Int]] {
    var result = [[Int]]()
    var up = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)
    var right = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)

    func canBuild() -> Bool {
        for value in result {
            switch value[2] {
            case 0:
                // 기둥
                if value[1] == 0 || (value[1] > 0 && up[value[0]][value[1] - 1]) || (value[0] > 0 && right[value[0] - 1][value[1]]) || right[value[0]][value[1]] {
                    continue
                } else {
                    return false
                }
            case 1:
                // 보
                if (value[1] > 0 && up[value[0]][value[1] - 1]) || (value[0] + 1 <= n && value[1] > 0 && up[value[0] + 1][value[1] - 1]) || (value[0] > 0 && value[0] + 1 <= n && right[value[0] - 1][value[1]] && right[value[0] + 1][value[1]]) {
                    continue
                } else {
                    return false
                }
            default:
                return false
            }
        }

        return true
    }

    for build in build_frame {
        switch build[3] {
        case 0:
            // 제거
            if !result.isEmpty {
                if let index = result.firstIndex(of: [build[0], build[1], build[2]]) {
                    if build[2] == 0 {
                        up[build[0]][build[1]] = false
                    } else {
                        right[build[0]][build[1]] = false
                    }
                    result.remove(at: index)
                    if !canBuild() {
                        result.append([build[0], build[1], build[2]])
                        if build[2] == 0 {
                            up[build[0]][build[1]] = true
                        } else {
                            right[build[0]][build[1]] = true
                        }
                    }
                }
            }
        case 1:
            // 추가
            if build[2] == 0 {
                up[build[0]][build[1]] = true
            } else {
                right[build[0]][build[1]] = true
            }
            result.append([build[0], build[1], build[2]])
            if !canBuild() {
                result.removeLast()
                if build[2] == 0 {
                    up[build[0]][build[1]] = false
                } else {
                    right[build[0]][build[1]] = false
                }
            }
        default:
            break
        }
    }

    return result.sorted(by: {
            if $0[0] == $1[0] && $0[1] == $1[1] {
                return $0[2] < $1[2]
            } else if $0[0] == $1[0] {
                return $0[1] < $1[1]
            } else {
                return $0[0] < $1[0]
            }
    })
}
