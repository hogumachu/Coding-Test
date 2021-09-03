// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 순위 검색
// https://programmers.co.kr/learn/courses/30/lessons/72412
// 풀이 : hogumachu

import Foundation

func solution(_ info: [String], _ query: [String]) -> [Int] {
    // info 에 대한 케이스를 저장하기 위한 dictionary
    var dict: [String: [Int]] = [:]

    // 결과 값을 저장하기 위한 result
    var result = Array(repeating: 0, count: query.count)

    // info 에 대한 반복문
    for info in info {
        // 각 케이스에 "-" 을 포함하여 가능한 모든 경우를 dict 에 할당해줌
        let data = info.split { $0 == " "}
        let languages = [data[0], "-"]
        let jobs = [data[1], "-"]
        let careers = [data[2], "-"]
        let foods = [data[3], "-"]

        for lang in languages {
            for job in jobs {
                for career in careers {
                    for food in foods {
                        if dict["\(lang) \(job) \(career) \(food)"] == nil {
                            dict["\(lang) \(job) \(career) \(food)"] = [Int(data[4])!]
                        } else {
                            dict["\(lang) \(job) \(career) \(food)"]!.append(Int(data[4])!)
                        }
                    }
                }
            }
        }
    }

    // 값을 찾기 위해 (이진 탐색) dict 을 오름차순으로 정렬함
    for key in dict.keys {
        dict[key] = dict[key]!.sorted()
    }

    // query 에 대한 반복문
    for index in 0..<query.count {
        // query (String) 을 배열로 할당함
        let queryArr = query[index].split { $0 == " "}
        // 0, 2, 4, 6, 7
        // index 값으로 0은 언어, 2는 직업, 4는 경력, 6은 소울푸드, 7은 값
        let order = "\(queryArr[0]) \(queryArr[2]) \(queryArr[4]) \(queryArr[6])"

        // 만약 해당 쿼리가 dictionary 에 있으면 진행
        // 만약 없다면 이미 해당 index 위치에 result 는 0이 되어있음
        if dict[order] != nil {
            // 먼저 작성하기 쉽게 배열로 할당하고
            let arr = dict[order]!

            // 이것도 작성하기 쉽게 num 이라 부름
            let num = Int(queryArr[7])!

            // 이진 탐색을 위한 left, right, mid 를 할당
            var left = 0
            var right = arr.count - 1
            var mid = 0

            // 이진 탐색
            while left <= right {
                mid = (left + right) / 2

                // arr[mid] 이 num 보다 작을 때 left 값이 변경됌
                // 값이 같을 때는 안됌
                if arr[mid] < num {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            // left 의 최대값은 right, 최소값은 0임

            result[index] = arr.count - left
        }
    }

    return result
}
