// 출처 : HackerRank Left Rotation
// https://www.hackerrank.com/challenges/sparse-arrays
// 풀이 : hogumachu

func matchingStrings(strings: [String], queries: [String]) -> [Int] {
    var dic: [String: Int] = [:]
    var results: [Int] = []

    for str in strings {
        if dic[str] == nil {
            dic[str] = 1
        } else {
            dic[str]! += 1
        }
    }

    for query in queries {
        results.append(dic[query] ?? 0)
    }

    return results
}
