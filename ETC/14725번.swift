// 출처 : 백준 개미굴
// https://www.acmicpc.net/problem/14725
// 풀이 : hogumachu
// 단순한 트리 문제

// list 생성
var list: [LinkedList] = []

for _ in 0..<Int(readLine()!)! {
    // input 을 만드는데 처음 값은 사용 안해서 dropFirst 로 제거하고 map 을 이용하여 String 배열로 만듦
    var input = readLine()!.split { $0 == " " }.dropFirst().map { String($0) }

    // 배열의 첫 번째 값 사용
    let first = input.removeFirst()

    // 만역 list 에 포함되어 있으면
    if list.contains(where: { $0.value == first }) {
        // 해당 인덱스를 얻어
        let index = list.firstIndex { $0.value == first }!
        // 그 위치에 배열을 넣어줌
        list[index].append(input)
    } else {
        // list에 포함되지 않았으면
        // 새로운 linkedList 를 생성
        let linkedList = LinkedList(value: first)
        // 그 linkedList 에 배열을 넣어주고
        linkedList.append(input)
        // list 에 linkedList 를 넣어줌
        list.append(linkedList)
    }
}

// 사전순으로 출력해야해서 정렬함
list.sort(by: { $0.value < $1.value })

for l in list {
    // 처음 prefix 는 없으므로 "" 로 넣어줌
    l.visit("")
}

// LinkedList
class LinkedList {
    // 자신의 값을 가짐
    let value: String

    // 자식을 저장하는 배열
    var child: [LinkedList] = []

    // 초기화
    init(value: String) {
        self.value = value
    }

    // 배열을 append 하는 함수
    func append(_ elements: [String]) {
        // 배열이 비었으면 종료
        if elements.isEmpty {
            return
        }

        // elements 를 변경해야해서 variable 로 할당함
        var elements = elements

        // 첫 번째 값
        let first = elements.removeFirst()

        // 만약 child 에 있으면
        if child.contains(where: { $0.value == first }) {
            // child 의 index 를 찾고 append 함
            let index = child.firstIndex { $0.value == first }!
            child[index].append(elements)
        } else {
            // child 에 없으면
            // 새로운 linkedList 를 만들고
            let newList = LinkedList(value: first)
            // child 에 추가한 후
            child.append(newList)
            // 해당 linkedList 에 append 함
            child.last!.append(elements)
        }
    }

    // 결과 출력하는 함수
    func visit(_ prefix: String) {
        // 먼저 자신을 출력
        print(prefix + value)

        // 만약 방문할 곳이 더 없다면 return
        if child.isEmpty {
            return
        }

        // 사전순으로 출력해야하기 때문에 정렬함
        let sortedChild = child.sorted { $0.value < $1.value }

        // 정렬된 상태에서 prefix 에 "--" 를 추가하여 visit 실행
        for c in sortedChild {
            c.visit(prefix + "--")
        }
    }
}
