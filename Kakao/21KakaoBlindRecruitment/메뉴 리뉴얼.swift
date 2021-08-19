// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 메뉴 리뉴얼
// https://programmers.co.kr/learn/courses/30/lessons/72411
// 풀이 : hogumachu

import Foundation

func solution(_ orders: [String], _ course: [Int]) -> [String] {
    // key - value 저장을 위한 dictionary 와 여러 배열을 생성함.
    var dict: [String: Int] = [:]
    var ord: [[String]] = Array(repeating: [], count: orders.count + 1)
    var getCourse: [Int] = Array(repeating: 0, count: course.last! + 1)
    var result: [String] = []

    // dictionary 에 order 를 저장하는 함수
    // order가 몇 번 발생했는 지를 파악하는 함수
    func appendDict(_ arr: [Character], _ count: Int, _ index: Int, _ counting: Int, _ str: String) {
        if counting == count {
            if dict[str] != nil {
                dict[str]! += 1
            } else {
                dict[str] = 1
            }
        } else {
            if index >= arr.count {
                return
            }
            for i in index..<arr.count {
                appendDict(arr, count, i + 1, counting + 1, str + "\(arr[i])")
            }
        }
    }

    // order 를 정렬하여 배열로 만들고 위에 있는 appendDict 를 실행함
    for order in orders {
        let sortedOrder = order.sorted()
        for count in course {
            appendDict(sortedOrder, count, 0, 0, "")
        }
    }

    // ord 배열에 2번 이상 order 가 되었다면 저장함
    for element in dict {
        if element.value > 1 {
            ord[element.value].append(element.key)
        }
    }

    // 저장된 ord 의 배열 뒤부터 시작하여 getCourse 에 저장된 값보다 작거나 같을 시에 result 에 order 를 저장함
    for i in stride(from: ord.count - 1, to: 1, by: -1) {
        for value in ord[i] {
            // value.count 는 course 가 어떤 것인지 (2코스인지 3코스인지) 알 수 있고
            // getCourse[value.count] 는 해당 코스에 저장된 값 (그 코스를 최대 몇 번 시켰는지) 에 대해 알 수 있음
            // 만약 그 코스의 횟수와 동일하게 시키거나 많이 시켰다면 그 코스의 최대값 (getCourse[value.count]) 는 i가 되고 result 에 그 order 를 append 함 
            if getCourse[value.count] <= i {
                getCourse[value.count] = i
                result.append(value)
            }
        }
    }

    // 오름차순으로 정렬하여 리턴
    return result.sorted()
}
