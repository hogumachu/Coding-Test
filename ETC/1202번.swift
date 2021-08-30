// 출처 : 백준 보석 도둑
// https://www.acmicpc.net/problem/1202
// 풀이 : hogumachu

// 우선순위큐를 이용하면 해결되는 문제
// 가방에는 최대 1개의 보석만 넣을 수 있음 -> 그리디하게 풀기
// 가장 작은 무게의 가방부터 시작하면 됌
// 보석은 무게가 가장 작은 것부터 시작
// 큐에서는 보석의 가격으로 정렬함

// 가장 작은 무게의 가방부터 시작을 해서
// 이 가방에 수용할 수 있는 보석을 모두 큐에 집어 넣음
// 만약 그렇지 못한 보석이 나온다면 큐가 비어있지 않다면 큐에 있는 값을 pop함
// pop된 값은 현재 큐에 들어있던 보석 (현재 가방에 넣을 수 있는 무게) 에서 가장 비싼 값의 보석

// 그리고 다음 가방에서도 위와 동일하게 진행함
// 이미 가방과 보석들은 오름차순으로 정렬되어있기 때문에
// 현재 큐에 들어있는 보석들 모두 다음 가방에 넣을 수 있는 무게임

// n과 k 값을 얻음
let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
// 보석을 저장할 tuple 배열 생성
var jewelries: [(Int, Int)] = []
// 가방 무게를 저장할 배열 생성
var bags: [Int] = []

// 보석 저장
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    jewelries.append((input[0], input[1]))
}

// 가방 저장
for _ in 0..<k {
    bags.append(Int(readLine()!)!)
}

// 보석과 가방을 오름차순으로 정렬함
jewelries.sort { $0.0 < $1.0 }
bags.sort { $0 < $1 }

// queue 생성 -> 가격이 높은 순으로 정렬함
// jewelries.1 이 가격이므로 $0.1 > $1.1 로 정렬
var queue = PQ<(Int, Int)>(sort: {$0.1 > $1.1 })

// 결과 값 생성
var result = 0

// 보석 index 생성
var index = 0

// 가방으로 반복문 시작
for bag in bags {
    // index의 크기가 넘어가지 않고, 보석의 무게를 가방이 수용할 수 있으면
    while index < jewelries.count && jewelries[index].0 <= bag {
        // queue 에 해당 보석에 대한 정보를 집어 넣고
        queue.push(jewelries[index])
        // 다음 보석에 대한 비교 시작
        index += 1
    }

    // 여기까지 왔다는 것은 bag 가 수용할 수 있는 보석을 queue 에 집어 넣었다는 것
    // queue 가 비어있지 않다면
    // 가장 가격이 높은 (queue 의 최상위) 값을 result 에 더해줌
    if !queue.isEmpty() {
        result += queue.pop()!.1
    }
}

// 결과 실행
print(result)

// 우선순위큐 구조체
public struct PQ<T> {
    private var arr: [T] = []
    let order: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.order = sort
    }

    func isEmpty() -> Bool {
        return arr.isEmpty
    }

    mutating func push(_ element: T) {
        arr.append(element)
        bottomUp()
    }

    mutating func pop() -> T? {
        if arr.isEmpty {
            return nil
        }
        arr.swapAt(0, arr.count - 1)
        let last = arr.removeLast()

        topDown()

        return last
    }

    mutating func bottomUp() {
        var index = arr.count - 1
        while index > 0 {
            let next = (index - 1) / 2
            if !order(arr[index], arr[next]) {
                break
            }

            arr.swapAt(index, next)
            index = next
        }
    }

    mutating func topDown() {
        if arr.count <= 1 {
            return
        }

        var index = 0

        while 2 * index + 1 < arr.count {
            var next = 2 * index + 1

            if next < arr.count - 1 && order(arr[next + 1], arr[next]) {
                next = next + 1
            }

            if !order(arr[next], arr[index]) {
                break
            }

            arr.swapAt(index, next)
            index = next
        }
    }
}
