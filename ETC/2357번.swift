// 출처 : 백준 최솟값과 최댓값
// https://www.acmicpc.net/problem/2357
// 풀이 : hogumachu
// 세그먼트 트리를 이용하는 문제
// 배열 값을 할당하는 것에서 조금 헤맸음
// 추후 다시 풀어보기

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var values: [Int] = []
var minArray = Array(repeating: Int.max, count: n * 4)
var maxArray = Array(repeating: 0, count: n * 4)

for _ in 0..<n {
    values.append(Int(readLine()!)!)
}

// index 로 접근하므로 0 ~ n - 1 로 설정
_ = setMaxValue(0, n - 1, 1)
_ = setMinValue(0, n - 1, 1)

for _ in 0..<m {
    let input = readLine()!.split { $0 == " " }.map {Int(String($0))! }

    // index 접근이므로 각 input 에도 - 1 함
    print(findValue(0, n - 1, input[0] - 1, input[1] - 1, 1, false), findValue(0, n - 1, input[0] - 1, input[1] - 1, 1, true))

}

// 최솟값을 설정하는 함수
// 1차원 배열에 설정하기 위한 함수
func setMinValue(_ left: Int, _ right:Int, _ node: Int) -> Int {
    // 만약 left == right 라면
    if left == right {
        // values[left] 를 저장하고 리턴함
        minArray[node] = values[left]
        return minArray[node]
    }

    // 절반을 나눠서
    let mid = (left + right) / 2

    // mid 기준 왼쪽 오른쪽을 재귀 호출함 (left == right 에 종료)
    minArray[node] = min(setMinValue(left, mid, node * 2), setMinValue(mid + 1, right, node * 2 + 1))
    return minArray[node]
}

// setMinValue 와 동일
func setMaxValue(_ left: Int, _ right: Int, _ node: Int) -> Int {
    if left == right {
        maxArray[node] = values[left]
        return maxArray[node]
    }

    let mid = (left + right) / 2

    maxArray[node] = max(setMaxValue(left, mid, node * 2), setMaxValue(mid + 1, right, node * 2 + 1))
    return maxArray[node]

}

// 1차원 배열로 설정한 세그먼트 트리를 찾는 함수
func findValue(_ s: Int, _ e: Int, _ left: Int, _ right: Int, _ node: Int, _ isMax: Bool) -> Int {
    // 범위를 벗어남
    if right < s || e < left {
        return isMax ? Int.min : Int.max
    }

    // 올바른 값으로 들어왔으므로 해당 node 에 있는 값을 출력
    if left <= s && e <= right {
        return isMax ? maxArray[node] : minArray[node]
    }

    // 반을 나눠서
    let mid = (s + e) / 2

    // 왼쪽 오른쪽 탐색
    let a = findValue(s, mid, left, right, node * 2, isMax)
    let b = findValue(mid + 1, e, left, right, node * 2 + 1, isMax)
    return isMax ? max(a, b) : min(a, b)
}
