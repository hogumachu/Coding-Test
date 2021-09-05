// 출처 : 프로그래머스 2021 카카오 채용연계형 인턴십 표 편집
// https://programmers.co.kr/learn/courses/30/lessons/81303
// 풀이 : hogumachu

import Foundation

func solution(_ n: Int, _ k: Int, _ cmd: [String]) -> String {
    // Node 를 담을 배열 생성
    var nodes: [Node] = []

    // 제거된 Node 의 index (value) 를 담을 배열
    var removed: [Int] = []

    // k 값이 바뀌니 variable 로 변경
    var k = k

    // 초기 값을 넣어줌
    nodes.append(Node.init(value: 0))

    // 반복하여 node 를 배열에 넣어줌
    for i in 1..<n {
        let node = Node.init(value: i)
        // 왼쪽 노드의 오른쪽을 현재 노드로
        nodes[i - 1].right = node

        // 현재 노드의 왼쪽을 왼쪽 노드로
        node.left = nodes[i - 1]

        // nodes 배열에 넣어줌
        nodes.append(node)
    }

    // 명령에 대한 반복문
    for cmd in cmd {
        switch cmd {
        // C 는 제거
        case "C":
            // 먼저 배열에 제거된 index 값을 넣어줌
            removed.append(k)

            // k 번째 노드의 remove 함수를 호출 (Int 값 리턴함) 하여 k 에 할당함
            k = nodes[k].remove()
        // Z 는 복구
        case "Z":
            // 만약 제거된 값이 있다면
            if !removed.isEmpty {
                let last = removed.removeLast()
                // 해당 index 를 restore 함
                nodes[last].restore()
            }
        default:
            let order = cmd.split { $0 == " " }
            switch order[0] {
            // U 는 위로 (여기선 left 로 이동)
            case "U":
                // k번째 있는 node 에서 order[1] 만큼 up 하여 (Int 값 리턴함) k 값에 할당
                k = nodes[k].up(Int(order[1])!)
            // D 는 아래 (여기선 right 로 이동)
            case "D":
                // 위와 동일
                k = nodes[k].down(Int(order[1])!)
            default:
                break
            }
        }
    }

    // 결과 저장 값
    var result = ""

    // 노드만큼 반복
    for node in nodes {
        // 결과 값에 node 에 저장한 결과를 추가함
        result += node.result
    }

    return result
}

// Node Class
class Node {
    // value 값 저장 (index 값과 동일)
    let value: Int

    // left (Up) Node
    // 가장 왼쪽이면 left 가 없을 수 있으니 Optional 로 함
    var left: Node?

    // 가장 오른쪽이면 right 가 없을 수 있으니 Optional 로 함
    var right: Node?

    // 간단하게 결과 값을 얻기 위해 저장함
    var result = "O"

    init(value: Int) {
        self.value = value
    }

    // up 함수
    func up(_ count: Int) -> Int {
        // 만약 이동을 다했으면 value 리턴
        if count == 0 {
            return value
        }

        // 만약 더이상 이동 못하면 value 리턴
        if left == nil {
            return value
        // 그렇지 않으면 left 로 이동하여 up 함수를 count - 1 을 넣어 호출
        } else {
            return left!.up(count - 1)
        }
    }

    // down 함수, up 과 동일
    func down(_ count: Int) -> Int {
        if count == 0 {
            return value
        }
        if right == nil {
            return value
        } else {
            return right!.down(count - 1)
        }
    }

    // 제거 함수
    func remove() -> Int {
        // 먼저 result 값을 "X" 로 변경
        result = "X"

        // 왼쪽 오른쪽 노드가 전부 있다면
        if left != nil && right != nil {
            // 왼쪽 노드의 오른쪽을 현재 노드의 오른쪽으로
            left!.right = right
            / 오른쪽 노드의 왼쪽을 현재 노드의 왼쪽으로
            right!.left = left
            return right!.value

            // 만약 right 만 있다면
        } else if left == nil {
            // right 의 왼쪽을 nil 로 함
            right!.left = nil
            return right!.value

            // left 만 있을 때도 마찬가지임
        } else {
            left!.right = nil
            return left!.value
        }
    }

    // 복원 함수
    func restore() {
        // 먼저 result 를 "O" 로 변경
        result = "O"

        // 왼쪽 오른쪽 모두 있다면
        if left != nil && right != nil {
            // 둘 다 현재 노드로 설정
            left!.right = self
            right!.left = self

            // 오른쪽만 있다면 오른쪽만 설정
        } else if left == nil {
            right!.left = self

            // 왼쪽만 있다면 왼쪽만 설정
        } else {
            left!.right = self
        }
    }
}
