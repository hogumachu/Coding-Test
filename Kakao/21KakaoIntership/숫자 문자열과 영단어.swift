// 출처 : 프로그래머스 2021 카카오 채용연계형 인턴십 숫자 문자열과 영단어
// https://programmers.co.kr/learn/courses/30/lessons/81301
// 풀이 : hogumachu

import Foundation

func solution(_ places: [[String]]) -> [Int] {
    // 결과를 저장할 result
    var result: [Int] = []

    // 배열 값을 받아 거리두기가 지켜지는 지 확인하는 함수
    func find(_ arr: [String]) -> Bool {
        // 방문 함수
        func visit(_ x: Int, _ y: Int, _ canMove: Int, _ origin: (Int, Int)) -> Bool {
            // 만약 현재 거리에서 더이상 이동할 수 없으면 false 리턴
            if canMove == 0 {
                return false
            }

            // 위, 오른쪽, 아래, 왼쪽으로 이동
            let moveX = [-1, 0, 1, 0]
            let moveY = [0, 1, 0, -1]

            for i in 0..<moveX.count {
                // 만약 x와 y 를 움직이는데 index 를 벗어나지 않으면
                if x + moveX[i] >= 0 && x + moveX[i] < arr.count && y + moveY[i] >= 0 && y + moveY[i] < arr.count {
                    // 그 위치가 사람이고, 처음 시작했던 (origin) 값이 아니면
                    if arr[x + moveX[i]][y + moveY[i]] == "P" && !(x + moveX[i] == origin.0 && y + moveY[i] == origin.1) {
                        // 거리두기가 지켜지지 않는 것이므로 true 리턴
                        return true
                    // 만약 이동가능한 위치면
                    } else if arr[x + moveX[i]][y + moveY[i]] == "O" {
                        // 그 위치에서 이동할 수 있는 거리를 -1 하고 방문
                        if visit(x + moveX[i], y + moveY[i], canMove - 1, (x, y)) {
                            return true
                        }
                    }
                }
            }

            // 여기까지 왔으면 거리두기 안지켜지는 것을 못찾았으므로 false 리턴
            return false
        }

        // 반복
        for i in 0..<arr.count {
            for j in 0..<arr[i].count {
                // 만약 이 위치가 사람이면
                if arr[i][j] == "P" {
                    // 방문했을 때 거리두기 지켜지지 않는 것을 발견하면 -> true 리턴
                    if visit(i, j, 2, (i, j)) {
                        return true
                    }
                }
            }
        }
        return false
    }

    // 위치 배열을 받아서
    for place in places {
        // find 함수를 불러옴
        if find(place) {
            // 만약 거리두기가 안되고 있음을 찾으면 0을 append
            result.append(0)
        } else {
            // 그렇지 않으면 1을 append
            result.append(1)
        }
    }

    return result
}

// String 을 배열처럼 접근하기 위해 subscript 를 사용
extension String {
    subscript (index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}
