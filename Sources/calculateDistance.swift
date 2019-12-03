import Foundation
// точка не будем использовать CGPoint
public struct Point {
    var x: Double
    var y: Double
    // инициализаторы должны быть не автоматические
    public init(x: Double, y: Double){
        self.x = x
        self.y = y
    }
}
//исходный файл coordinates.json
public struct PointsFromWeb: Codable{
   public var id: String
   public var value: String
    public init(id: String, value: String){
        self.id = id
        self.value = value
    }
    
    
}
//то что пришло с JSON c рассчитанным от исходной точки расстоянием
public struct PointFromJSON{
    public var id: String
    public var distance: Double
    public var coords: Point
    public init(id: String, distance: Double, coords: Point){
        self.id = id
        self.distance = distance
        self.coords = coords
    }
}


// как будем считать расстояние
public enum DistanceTechnique {
    case Euclidean
    case EuclideanSquared
    case Manhattan
}


public func calculateDistance(start: Point, end: Point, technique: DistanceTechnique) -> Double {
// вложенные (Nested) функции
    func Squares() -> Double {
    let deltaX = start.x - end.x
        let deltaY = start.y - end.y
        return deltaX * deltaX + deltaY * deltaY
        }
    func Euclidean() -> Double {
            return sqrt(Squares())
    }
    func Manhattan() -> Double {
    return abs(start.x - end.x) + abs(start.y - end.y) }

    //метод сравнения
    switch technique {
        // по Пифагору
    case .Euclidean:
         return Euclidean()
        // если миллион точек приходит (например юзер водит пальцем по экрану)
        // будет сравнивать квадраты расстояний тк все равно что сравнивать
    case .EuclideanSquared:
         return Squares()
        // алгоритм таксистов (Манхеттен)
    case .Manhattan:
         return Manhattan()
    }
}
