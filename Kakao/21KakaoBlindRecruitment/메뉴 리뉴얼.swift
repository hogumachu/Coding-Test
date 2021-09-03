// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 메뉴 리뉴얼
// https://programmers.co.kr/learn/courses/30/lessons/72411
// 풀이 : hogumachu
// orders 에 있는 String 에 대해 2개 이상 선택하여 값을 더하고 그에 대한 filter 로 답을 해결하는 문제

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    // 값의 개수를 셀 Dictionary 생성
    var dict: [String: Int] = [:]

    // String 으로 된 orders 를 배열로 변경함
    var arrOrders: [[Character]] = Array(repeating: [], count: orders.count)

    // 코스 수의 최대값을 저장할 배열
    var maxCount: [Int] = Array(repeating: 0, count: course.last! + 1)

    // 결과
    var result: [String] = []

    // orders 를 배열로 만들어서 arrOrders 에 저장해줌
    // course 는 정렬되어 있지만, orders 에는 정렬되어 있다는 얘기가 없음 -> 값을 오름차순으로 정렬해야함
    for i in 0..<orders.count {
        let arrOrder = orders[i].map { $0 }
        arrOrders[i] = arrOrder.sorted()
    }

    // 핵심 함수
    func visit(_ order: [Character], _ arr: [Character] ,_ index: Int) {
        // 코스 2개 이상 선택했을 때
        if arr.count > 1 {
            // 만약 코스 수가 course 배열에 있는 마지막 값보다 크게 되면 굳이 구할 필요 없으므로 return
            if arr.count > course.last! {
                return
            }

            // 코스를 String 으로 변경하고
            let str = String(arr)

            // Dictionary 에 추가함
            if dict[str] == nil {
                dict[str] = 1
            } else {
                dict[str]! += 1
                // 만약 현재 코스 수가 최대 값이면 갱신
                maxCount[str.count] = max(maxCount[str.count], dict[str]!)
            }
        }

        // 핵심 함수 반복
        for i in index..<order.count {
            visit(order, arr + [order[i]], i + 1)
        }
    }

    // 핵심 함수 반복
    for order in arrOrders {
        visit(order, [], 0)
    }

    // Dictionary 를 문제 조건에 맞춰 필터링함
    dict.filter {
        // 코스의 주문 수는 1번 이상만 가능 (1번 일때는 X, 0번은 저장되지 않으므로 쓸 이유 없음)
        if $0.value == 1 {
            return false

            // 만약 현재 코스 주문 수가 최대값일 때 저장함
        } else if maxCount[$0.key.count] == $0.value {
            return true
            
            // 그렇지 않으면 리턴
        } else {
            return false
        }
    }
    // 결과가 key 에 대해 오름차순으로 정렬되어 있으므로 정렬함
    .sorted {
        $0.key < $1.key

        // forEach 로 하여 course 에서 얘기한 정보만 result 에 append
    }.forEach {
        if course.contains($0.key.count) {
            result.append($0.key)
        }
    }

    return result
}
