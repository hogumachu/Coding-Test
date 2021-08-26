// 출처 : 프로그래머스 2019 KAKAO BLIND RECRUITMENT 길 찾기 게임
// https://programmers.co.kr/learn/courses/30/lessons/42892
// 풀이 : hogumachu
// Tree 구조와 전위, 후위 탐색에 대해 알아야 했음
// 구조를 파악하고 있다면 쉽게 풀 수 있는 문제인 듯

import Foundation

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var addNodeInfo = nodeinfo
    var result: [[Int]] = []
    
    // addNodeInfo 에 index 값들을 저장했음
    for i in 0..<addNodeInfo.count {
        addNodeInfo[i].append(i + 1)
    }

    // index 값들을 저장한 이유는 정렬하기 때문에 index 위치 (값이 들어온 순서) 가 어떤 지 모르기 때문
    let nodeInfo = addNodeInfo.sorted {
        if $0[1] == $1[1] {
            return $0[0] < $1[0]
        } else {
            return $0[1] > $1[1]
        }
    }

    // rootNode 초기 값을 생성하였음 x, y 값을 넣고 index (들어온 순서) 를 넣어줬음
    let rootNode = Node(x: nodeInfo[0][0], y: nodeInfo[0][1], index: nodeInfo[0][2])

    // 정렬된 nodeInfo 로 rootNode 에 구현해놓은 appendNode 실행
    for i in 1..<nodeInfo.count {
        rootNode.appendNode(nodeInfo[i])
    }

    // result 에 전위 탐색과 후위 탐색의 결과를 넣었음
    result.append(rootNode.preOrder())
    result.append(rootNode.postOrder())

    return result
}

// Node 구조
class Node {
    let x: Int
    let y: Int
    let index: Int
    var left: Node?
    var right: Node?

    init(x: Int, y: Int, index: Int) {
        self.x = x
        self.y = y
        self.index = index
    }

    // 문제 조건에 나온대로 left 또는 right 에 node 를 넣어줬음
    func appendNode(_ info: [Int]) {
        if info[0] < x {
            if left == nil {
                let left = Node(x: info[0], y: info[1], index: info[2])
                self.left = left
            } else {
                left!.appendNode(info)
            }
        } else if info[0] > x {
            if right == nil {
                let right = Node(x: info[0], y: info[1], index: info[2])
                self.right = right
            } else {
                right!.appendNode(info)
            }
        }
    }

    // preOrder 의 결과를 배열로 리턴함
    func preOrder() -> [Int] {
        if left == nil && right == nil {
            return [index]
        } else if left == nil {
            return [index] + right!.preOrder()
        } else if right == nil {
            return [index] + left!.preOrder()
        } else {
            return [index] + left!.preOrder() + right!.preOrder()
        }
    }

    // postOrder 의 결과를 배열로 리턴함
    func postOrder() -> [Int] {
        if left == nil && right == nil {
            return [index]
        } else if left == nil {
            return right!.postOrder() + [index]
        } else if right == nil {
            return left!.postOrder() + [index]
        } else {
            return left!.postOrder() + right!.postOrder() + [index]
        }
    }
}
