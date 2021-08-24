// 출처 : 프로그래머스 2021 카카오 채용연계형 인턴십 표 편집
// https://programmers.co.kr/learn/courses/30/lessons/81303
// 풀이 : hogumachu
// linked list 방식을 배열로 풀었는데 시간 초과가 났음
// 마지막 k 의 값으로 왼쪽과 오른쪽으로 방문하여서 결과 값을 "X" 가 아닌 "O" 로 변경했는데 그게 시간 초과 났었음

import Foundation

func solution(_ n: Int, _ k: Int, _ cmd: [String]) -> String {
    var k = k
    // left 노드
    var left = Array(repeating: 0, count: n)
    // right 노드
    var right = Array(repeating: 1, count: n)
    // 제거된 값
    var removed: [[Int]] = []
    // 결과 저장용
    var result = Array(repeating: true, count: n)

    // left 와 right 의 값을 초기화함
    for i in 1...n - 1 {
        left[i] = i - 1
        right[i] = i + 1
    }

    right[n - 1] = n - 1

    for cmd in cmd {
        switch cmd {
        case "C":
            // 먼저 값을 제거하기 전에 왼쪽 값 (l) 과 오른쪽 값 (r) 을 얻음
            let l = left[k]
            let r = right[k]
            // 제거함
            result[k] = false
            removed.append([k, l, r])

            // 왼쪽값과 오른쪽값 둘 다 k 와 같지 않다는 것은 중간에 낀 값이라는 것 (왼쪽, 오른쪽 노드 존재)
            if l != k && r != k {
                // 따라서 왼쪽 노드의 오른쪽 값 변경, 오른쪽 노드의 왼쪽 값 변경
                right[l] = right[k]
                left[r] = left[k]
                // 그리고 k 는 오른쪽값으로 설정
                k = r

                // l 이 k 와 같다는 것은 현재 값이 가장 왼쪽 끝에 있다는 뜻
            } else if l == k && r != k {
                // 따라서 우측 노드의 왼쪽 값만 변경해줌
                // 변경해줄 때 우측 노드의 왼쪽 값은 자기 자신을 선택하도록 함
                left[r] = r
                k = r

                // 위와 동일함
            } else if l != k && r == k {
                right[l] = l
                k = l
            }
        case "Z":
            if removed.isEmpty {
                break
            }

            // removed 에 가장 최근에 저장된 값을 가져옴
            let last = removed.removeLast()
            let x = last[0]
            let l = last[1]
            let r = last[2]

            // 방문 가능
            result[x] = true

            // 케이스 별로 값을 업데이트함
            // 가운데 있는 경우
            if l != x && r != x {
                // x 의 왼쪽 노드의 오른쪽 값을 x 로 변경
                right[l] = x
                // x 의 오른쪽 노드의 왼쪽 값을 x 로 변경
                left[r] = x

            // 아래는 생략함
            } else if l == x && r != x {
                left[r] = x
            } else if l != x && r == x {
                right[l] = x
            }
        default:
            let order = cmd.split { $0 == " " }
            switch order[0] {
            // U 일때는 왼쪽으로 방문
            case "U":
                for _ in 1...Int(order[1])! {
                    if k == left[k] {
                        break
                    }
                    k = left[k]
                }
            // D 일때는 오른쪽으로 방문
            case "D":
                for _ in 1...Int(order[1])! {
                    if k == right[k] {
                        break
                    }
                    k = right[k]
                }
            default:
                break
            }

        }
    }

    // result 가 true 일 때는 "O" 를 false 일 때는 "X" 를 하여 String으로 바꿔줌
    return String(result.map { $0 ? "O" : "X" })
}
