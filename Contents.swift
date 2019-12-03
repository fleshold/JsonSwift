import Foundation


var U0: [PointFromJSON] = []

//точка отсчета
var A0 = Point( x: 6, y: 33)

let fPath = Bundle.main.path(forResource: "coordinates", ofType: "json")
let contentData = FileManager.default.contents(atPath: fPath!)
let json = String(data:contentData!, encoding: .utf8)!.data(using: .utf8)!
let decoder = JSONDecoder()
let coords = try decoder.decode([PointsFromWeb].self, from: json)
for coord in coords {

    let id:String = coord.id
    let value: String = coord.value
    let valuearr = value.components(separatedBy: ",")
    let B0 = Point(x: Double(valuearr[0])!, y: Double(valuearr[1])!)
    U0.append(PointFromJSON(id: id ,distance: calculateDistance(start: A0, end: B0, technique: .Euclidean),coords: B0))
}
//print(U0)
U0.sort(by: {$0.distance < $1.distance})
 print(U0)
