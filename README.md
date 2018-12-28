
# IdentityCLUTImageGenerator

A lookup table is a cube of color values: the red, green, and blue components of an input color map to the x, y, and z coordinates of a location in that cube, and at that location in the cube is a corresponding output color.

The 2D representation of a 3D color cube is an arrangement of slices.

For example, a 16 x 16 x 16 color cube becomes a horizontal strip of 16 squares, each 16 x 16 pixels (that is, a 256 x 16 image). Each square contains a gradation of red and green components, and together the 16 squares form a gradation for the blue component.

`IdentityCLUTImageGenerator.playground` generate 2D identity color lookup table images that can be use with image processing frameworks like [MetalPetal](https://github.com/MetalPetal/MetalPetal/), [GPUImage](https://github.com/BradLarson/GPUImage), [SceneKit](https://developer.apple.com/documentation/scenekit/scncamera/1644114-colorgrading), etc.

## Types

### CLUTImageDescriptor

**dimension**: Dimension of the color lookup table. [0~256]

**layout**: Layout of the color lookup table image.

### CLUTImageLayout

**horizontalTileCount**: Horizontal blocks of the color lookup table image.

**verticalTileCount**: Vertical blocks of the color lookup table image.

`horizontalTileCount * verticalTileCount` should be equal to the `CLUTImageDescriptor`'s `dimension`.

## Examples

- The identity 16x16x16 horizontal-strip-layout color lookup table image used by `SCNCamera.colorGrading` can be generated using:
        
        CLUTImageDescriptor(dimension: 16, layout: CLUTImageLayout(horizontalTileCount: 16, verticalTileCount: 1))

- The identity 64x64x64 square-layout color lookup table image used by `GPUImage` can be generated using:

        CLUTImageDescriptor(dimension: 64, layout: CLUTImageLayout(horizontalTileCount: 8, verticalTileCount: 8))
        


