pub struct Canvas {
    pub let width: UInt8
    pub let height: UInt8
    pub let pixels: String

    init(width: UInt8, height: UInt8, pixels: String) {
        self.width = width;
        self.height = height;
        // 123
        // 456
        // 789
        // 123456789
        self.pixels = pixels;
    }
}

pub resource Picture {
    pub let canvas: Canvas

    init(canvas: Canvas) {
        self.canvas = canvas
    }
}

pub fun serializeStringArray(_ lines: [String]) : String {
    var buffer = ""
    for line in lines {
        buffer = buffer.concat(line)
    }

    return buffer
}

pub fun main() {
    let pixelsX = [
    "*   *",
    " * * ",
    "  *  ",
    " * * ",
    "*   *"
    ]

    let canvasX = Canvas(
        width: 5,
        height: 5,
        pixels: serializeStringArray(pixelsX)
    )
    var count = 0
    let wall = "|"
    let FloorCeilling = "+-----+"
    let letterX <- create Picture(canvas: canvasX)
    let pixelsNum = letterX.canvas.width * letterX.canvas.height
    log(FloorCeilling)
    while count < Int(pixelsNum) {
        if count % 5 == 0 {
            log(wall.concat(letterX.canvas.pixels.slice(from: count, upTo: count + 5)).concat(wall))
        }
        count = count + 1
    }
    log(FloorCeilling)

    destroy letterX
}