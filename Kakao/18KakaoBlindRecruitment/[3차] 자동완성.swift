// 출처 : 프로그래머스 2018 KAKAO BLIND RECRUITMENT [3차] 자동완성
// https://programmers.co.kr/learn/courses/30/lessons/17685
// 풀이 : hogumachu
// 시간초과 (14, 19, 20, 21)
// 알파벳끼리 연결하여 했는데 시간 초과 났음
// 더 나은 방법 찾아보자

func solution(_ words:[String]) -> Int {
    let node = Node()
    var result = 0

    for word in words {
        node.firstAppend(word)
    }

    for word in words {
        result += node.firstVisit(word)
    }

    return result
}

class Node {
    var now = 0
    var indices: [Int] = Array(repeating: -1, count: 27)
    var index = 0
    var next: [Node] = []

    func firstAppend(_ str: String) {
        var str = str
        let first = Int(str.removeFirst().asciiValue!) - 97

        if indices[first] == -1 {
            let newNode = Node()
            newNode.append(str)
            indices[first] = index
            index += 1
            next.append(newNode)
        } else {
            let nextNode = next[indices[first]]
            nextNode.append(str)
        }
    }

    func append(_ str: String) {
        now += 1

        if !str.isEmpty {
            var str = str
            let first = Int(str.removeFirst().asciiValue!) - 97

            if indices[first] == -1 {
                let newNode = Node()
                newNode.append(str)
                indices[first] = index
                index += 1
                next.append(newNode)
            } else {
                let nextNode = next[indices[first]]
                nextNode.append(str)
            }
        }
    }

    func firstVisit(_ str: String) -> Int {
        var str = str
        let first = Int(str.removeFirst().asciiValue!) - 97
        return next[indices[first]].visit(str, 1)
    }

    func visit(_ str: String, _ count: Int) -> Int {
        if now == 1 || str.isEmpty {
            return count
        } else {
            var str = str
            let first = Int(str.removeFirst().asciiValue!) - 97

            return next[indices[first]].visit(str, count + 1)
        }
    }
}
