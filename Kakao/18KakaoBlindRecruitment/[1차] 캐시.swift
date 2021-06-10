// 출처 : 프로그래머스 2018 KAKAO BLIND RECRUITMENT [1차] 캐시
// https://programmers.co.kr/learn/courses/30/lessons/17680
// 풀이 : hogumachu

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache: [String] = []
    var result = 0
    if cacheSize == 0 {
        return 5 * cities.count
    }
    for city in cities {
        if cache.contains(where: {$0 == city.lowercased()}) {
            cache.append(city.lowercased())
            cache.remove(at: cache.firstIndex(of: city.lowercased())!)
            result += 1
        } else {
            if cache.count < cacheSize {
                cache.append(city.lowercased())
            } else {
                cache.removeFirst()
                cache.append(city.lowercased())
            }
            result += 5
        }

    }
    return result
}
