# image_cropper_view

A widget to crop your images.

![](https://raw.githubusercontent.com/gliheng/image_cropper_view/master/image_cropper_view.jpg)

## Features
- Supports pan, zoom, rotate gestures to position your image
- Only dart code included, no native dependency
- Support setting clip shape to either circle, rect, or rrect


## Getting started

Most likely you will use this as a new route to clip your image.

## Usage

```dart
var data = await Navigator.of(context)
  .push<ByteData>(MaterialPageRoute(builder: (contex) {
    return ImageCropper(
      image: Image.asset('assets/images/coffee.webp'),
      exportSize: const Size(400, 400),
      clipShape: ClipShape.circle,
    );
  }));
if (data != null) {
  // now data is a ByteData of png image
  var imageData = data.buffer.asUint8List();
  // you can display the image like this
  var img = Image.memory(imageData);
}
```

## Full options
`image`: An image object to crop

`exportSize`: How big you want the cropped image to be

`clipShape`: The shape of the clipped image circle, rect or rrect

`clipImage`: By default, the clip only affect preview, setting this to true also clip exported image

`clipRRectRadius`: If clipShape is rrect, you can use this to specify a radius for the rrect

`exportBackgroundColor`: backgroundColor for the exported image, if there's transparent pixels
