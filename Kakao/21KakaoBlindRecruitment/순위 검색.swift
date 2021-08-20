// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 순위 검색
// https://programmers.co.kr/learn/courses/30/lessons/72412
// 풀이 : hogumachu

import Foundation

func solution(_ info: [String], _ query: [String]) -> [Int] {
    var order: [String: [Int]] = [:]
    var result: [Int] = Array(repeating: 0, count: query.count)

    // order 에 info 로 만들 수 있는 모든 케이스를 생성하고 그에 해당 할 수 있는 값을 넣어줌
    for element in info {
        let arr = element.split(separator: " ")
        for lang in [arr[0], "-"] {
            for job in [arr[1], "-"] {
                for career in [arr[2], "-"] {
                    for food in [arr[3], "-"] {
                        if order["\(lang)\(job)\(career)\(food)"] != nil {
                            order["\(lang)\(job)\(career)\(food)"]!.append(Int(arr[4])!)
                        } else {
                            order["\(lang)\(job)\(career)\(food)"] = [Int(arr[4])!]
                        }
                    }
                }
            }
        }
    }

    // binarySearch 를 하기 위해 order 를 오름차순으로 정렬해줌
    for key in order.keys {
        order[key] = order[key]!.sorted()
    }


    for index in 0..<query.count {
        // query 를 이용하여 배열을 만들어 줌
        let arr = query[index].split(separator: " ")
        let num = Int(arr[7])!

        // 만약 order 에 값이 존재한다면
        if order["\(arr[0])\(arr[2])\(arr[4])\(arr[6])"] != nil {

            // 그 order 에 해당하는 배열을 할당
            let intArr = order["\(arr[0])\(arr[2])\(arr[4])\(arr[6])"]!

            // binarySearch 를 진행함
            var left = 0
            var right = intArr.count - 1
            var mid = 0

            while left <= right {
                mid = (left + right) / 2
                if intArr[mid] < num {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            // count 를 result 에 저장
            result[index] = intArr.count - left
        }
    }

    return result
}
