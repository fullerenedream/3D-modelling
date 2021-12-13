# 3D-modelling

A repo to share 3D models I made while playing with [my 3D printer](https://www.creality.com/goods-detail/ender-3-3d-printer).
  
Models in .scad files can be viewed and rendered to .stl with [OpenSCAD](http://openscad.org/).
Then you can run the .stl files through a slicer (I use [Cura](https://ultimaker.com/software/ultimaker-cura)), and print on your 3D printer if you have one.
  
I wrote  [ball-bearing-fidget.scad](https://github.com/fullerenedream/3D-modelling/blob/main/ball-bearing-fidget/ball-bearing-fidget.scad) and  [cake-parts.scad](https://github.com/fullerenedream/3D-modelling/blob/main/cake-parts/cake-parts.scad). (I created the counting blocks too, but in [TinkerCAD](https://www.tinkercad.com/), not OpenSCAD.)
  
I have also included stl files, slicer settings and G-code.
  
If you just want a quick look at the 3D models, try opening the stl files in [ViewSTL.com](https://www.viewstl.com/).
  
If you want to print a model, but you use a different slicer than Cura, you could try viewing the slicer settings file in a text editor and setting your slicer similarly. The slicer settings and G-code are what worked for me, using PLA filament on my [Ender 3](https://www.creality3dofficial.com/products/official-creality-ender-3-3d-printer). Your mileage may vary.
  
Printing tips for cake parts:
You can use the [cake-circle.inst.cfg](https://github.com/fullerenedream/3D-modelling/blob/main/cake-parts/cura-slicer-settings/cake-circle.inst.cfg) slicer settings for both sizes of circular cakes, and icing. Print icing upside down. For the wafer pieces, the "wafer" texture is created with the slicer settings, by choosing a square infill ("grid" in Cura) and setting the number of top layers to zero (so the infill is exposed).
  
Printing tips for counting blocks:
Print blocks 7 to 10 with a brim, to help them stand up while they're being printed.
  
Photos:  
[Cake parts](https://photos.app.goo.gl/GEJp1zVCgxGtLcqk7): I made these as an "expansion pack" for the [Tom et Charlotte cake stacking toy](https://www.amazon.ca/DJECO-Charlotte-Tom-DJ06610-japan/dp/B006CFJJB8). Designed in OpenSCAD  
[Ball bearing fidget toy](https://photos.app.goo.gl/ymF5GnSVvGzaD9kc9): Designed in OpenSCAD  
[Counting blocks](https://photos.app.goo.gl/Z6pQyTPhiAEHVYsG9): Designed in TinkerCAD
