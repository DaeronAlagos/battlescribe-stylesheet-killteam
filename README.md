## Battlescribe Stylesheet for Kill Team

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/R6R71YYK0)
### Preview

By using this stylesheet to export your roster from Battlescribe, you will be able to create a printable document like this
![](https://github.com/DaeronAlagos/battlescribe-stylesheet-killteam/blob/master/demo/demo-roster.png)
![](https://github.com/DaeronAlagos/battlescribe-stylesheet-killteam/blob/master/demo/demo-card-1.png)
![](https://github.com/DaeronAlagos/battlescribe-stylesheet-killteam/blob/master/demo/demo-card-2.png)


### Instructions for Battlescribe users

1. Download the stylesheet from [here](https://raw.githubusercontent.com/DaeronAlagos/battlescribe-stylesheet-killteam/master/dist/stylesheet.xsl) (right click and 'Save link as...').

2. Create your Kill Team in Battlescribe (Matched Play or Campaign).

3. Export in Battlescribe.
  `File -> Export roster...`
  
4. Browse for the XSL Stylesheet and select the file you downloaded in step 1.

5. Browse for the Destination File and select a folder where you want to save the file. Name the file; eg. mycampaign.html (note the .html here is important).

6. Click 'Export' then 'Done'.

7. Open the html file in your web browser and print as required.

### Instructions for Developers

#### Requirements

1. [Node 12](https://nodejs.org)
2. [wkhtmltopdf version 0.12.6 (with patched qt)](https://wkhtmltopdf.org/)

#### Development Process
1. Clone the repository
  `git clone https://github.com/DaeronAlagos/battlescribe-stylesheet-killteam.git`

2. Change to the project folder `cd battlescribe-stylesheets`

3. Install the required NPM modules `npm install`

4. Create a roster in Battlescribe and save it as a .ros file (not .rosz), to the battlescribe-stylesheet-killteam/data folder

5. Build your first distribution file `gulp build`

6. Run gulp with browser-sync `gulp --bsfile YOUR_FILE` (don't need to put .ros)

7. Edit the files in the src folder and see your changes in the web browser that opened when you started gulp