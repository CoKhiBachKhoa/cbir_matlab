# Content-based Image Retrieval System Matlab

##About the project

## Usage
* `extract_feature.m` : Extracting feature vector of image database into a `dataset.m` file, histogram intersection already in this
* `classFinder.m` : Find the label of specific image (ex: 456.jpg - class: flower)
* `preprocessingImage.m` : You need to preprocess both database image and query image. Include a bunch of works: Resize, Image Quantization, HSV convert, Noise Filter, ...(update later) 
* `dataset.mat` : Database of feature you extract from image, you can create your own with `extract_feature.m`

* `colorMoments` : A function that input an image and return a (1x9) feature vector which is result of calculation Moments metric
```
colorMoments('image.orig/put-image-here.jpg');
```
* `query_Hist` : Query similar image using Histogram Intersection
```
query_Hist('image.orig/put-image-here.jpg');
```
* `query_colorMoments.m` :Query similar image using 3 Color Moments metrics
```
colorMoments('image.orig/put-image-here.jpg');
```
* `query_colorCorrelogram.m` : Query similar image using Color Correlogram
```
query_colorCorrelogram.m('image.orig/put-image-here.jpg');
```
* `estimated_Precision` : Using Precision score to evaluate how efficient the algorithm (histogram intersection, color moments, ... you can use it to evaluated your algo!) works.
* `query_histAndMoments` : Combine HI and CM algorithm using ranking algo, the ultimate solution :grin:
* `README.md` : it's me :grin:

You need to extract the feature whether the image in database or query, its must be in the `dataset.mat`. Then just go a head run some `.m` file with input an image
<p align="right">(<a href="#top">back to top</a>)</p>
::
## Contact
Email: `thanhmai99bn@gmail.com`

Discord: `DaVinci@7955` :grin: