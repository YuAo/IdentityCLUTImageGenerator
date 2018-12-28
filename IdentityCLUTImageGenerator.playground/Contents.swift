
let descriptor = CLUTImageDescriptor(dimension: 16, layout: CLUTImageLayout(horizontalTileCount: 16, verticalTileCount: 1))

if let image = IdentityCLUTImageGenerator.generateIdentityCLUTImage(with: descriptor) {
    save(image: image, title: descriptor.title)
}

/*
 Utility Function
 Save image to "~/Downloads/" folder with title.
 */

import CoreImage

func save(image: CGImage, title: String) {
    let context = CIContext(options: nil)
    let ciImage = CIImage(cgImage: image)
    if let pngData = context.pngRepresentation(of: ciImage, format: CIFormat.BGRA8, colorSpace: CGColorSpaceCreateDeviceRGB(), options: [:]) {
        do {
            try pngData.write(to: URL(fileURLWithPath: "\(NSHomeDirectory())/Downloads/\(title).png"))
            print("Done")
        } catch {
            print("Error: \(error)")
        }
    }
}

