package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	import mx.core.ButtonAsset;
	
	[SWF(width="600", height="400", frameRate=30, backgroundColor=0xFFFFFF)]

	public class bitmapAbstract extends Sprite
	{
		public function bitmapAbstract()
		{	
			var pixels:BitmapData=new BitmapData(330,400,true,0x00FFFFFF);	
			var screen:Bitmap=new Bitmap(pixels);
			var pointW:Number;
			var pointH:Number;
			var pointW2:Number;
			var pointH2:Number;
var pointW3:Number;
var pointH3:Number;
var pointW4:Number;
var pointH4:Number;
pointW=Math.round(Math.random()*screen.width);
pointH=Math.round(Math.random()*screen.height);
pointW2=Math.round(Math.random()*screen.width);
pointH2=Math.round(Math.random()*screen.height);
pointW3=Math.round(Math.random()*screen.width);
pointH3=Math.round(Math.random()*screen.height);
pointW4=Math.round(Math.random()*screen.width);
pointH4=Math.round(Math.random()*screen.height);
var moveIt:Number;
var moveIt2:Number;
var moveIt3:Number;
var moveIt4:Number;
var moveIt5:Number;
var moveColor:Number;
var tempNumLine:int;
var tempNumH:int;
var tempNumW:int;
var tempNumH2:int;
var tempNumW2:int;
var tempNum3:int;
var drawOutcome:int;
var lineLength:Number=2;
var longLineLength:Number=150;
var alphaCountDown:int=100000;
var shadeTime:Boolean=false;
var alphaCount:Number=0;
var circleSize:int=500;
var maxLoop:int=10000;
var blendSkew:int;
var lineAlphaSkew:int;
var blendType:String="normal";
var color:uint=Math.random()*0xFFFFFF;
var lineColor:uint=0x000000;
var lineAlpha:Number;
var shapeAlpha:Number;
var alphaRev:Boolean=false;
var fib1:int=1;
var fib2:int=1;
var fib3:int=1;
var size:int;
var passCount:uint=1;
var colorTrans:ColorTransform = new ColorTransform();
addChild(screen);
screen.x=25;
screen.y=25;
//addChild(screen2);
var sprite:Sprite = new Sprite();
addChild(sprite);
var buttonOne:ButtonAsset = new ButtonAsset();
buttonOne.name = "Stop";
buttonOne.addEventListener(MouseEvent.CLICK, buttonOneClick);
function buttonOneClick(event:MouseEvent) {
	myTimer.stop();
	buttonOne.enabled = false;
	buttonTwo.enabled = true;
}
buttonOne.move(350, 450);
addChild(buttonOne);
var buttonTwo:ButtonAsset = new ButtonAsset();
buttonTwo.name = "Start";
buttonTwo.addEventListener(MouseEvent.CLICK, buttonTwoClick);
function buttonTwoClick(event:MouseEvent) {
	myTimer.start();
	buttonTwo.enabled = false;
	buttonOne.enabled = true;
}
buttonTwo.move(475, 450);
addChild(buttonTwo);
buttonTwo.enabled = false;

var redrawCount:uint=0;
var drawCount:TextField = new TextField();
drawCount.autoSize = "left"
drawCount.background=false;
drawCount.border=false;
var format:TextFormat = new TextFormat();
format.font="Verdana";
format.color=0x666666;
format.size=10;
format.underline=false;
drawCount.defaultTextFormat=format;
drawCount.text="Total Redraw: "+redrawCount;
addChild(drawCount);
drawCount.x=25;
drawCount.y=450;
var vertices:Vector.<Number> = new Vector.<Number>();

function drawLine(event:TimerEvent):void {
	setPoints();
	maxLoop=Math.ceil(Math.random()*25000);
	if (passCount==6) {
		passCount=1;
	}
	for (var i:int = maxLoop; i>1; i--) {
		if (alphaCountDown==0) {
			alphaCountDown=100000;
			alphaCount=0;
			alphaRev=false;
		}
		alphaCountDown--;
		if (alphaCountDown<21) {
			shadeTime=true;
			if (alphaCountDown==20) {
				fib1=fib2=fib3=1;
			}
			if (alphaCount>9) {
				alphaCount=10;
			}
			if (alphaCount==10) {
				alphaRev=true;
			}
		} else {
			shadeTime=false;
			lineLength=2;
		}
		tempNumLine=Math.floor(Math.random()*2);
		//add or subtract the moveIt value based on the temp variable
		if (tempNumLine==0) {
			lineColor=0x000000;
		} else if (tempNumLine==1) {
			lineColor=0xFFFFFF;
		}
		//create a weighted variable for the drawing function
		drawOutcome=Math.ceil(Math.random()*10000);
		lineAlphaSkew=Math.ceil(Math.random()*10000);
		if (lineAlphaSkew==1) {
			lineAlpha=Math.random()*.075;
			shapeAlpha=1;
			blendType="normal";
		} else if (lineAlphaSkew>=9800) {
			lineAlpha=Math.random()*.05;
			shapeAlpha=1;
			blendType="normal";
		} else {
			if (shadeTime==true) {
				if (alphaCount<10&&alphaRev==false) {
					alphaCount+=1;
				} else if (alphaRev==true) {
					alphaCount-=1;
				}
				fib3=fib1+fib2;
				fib1=fib2;
				fib2=fib3;
				lineLength=fib3/100;
				lineAlpha=(alphaCount/65);
				lineColor=0x000000;
				shapeAlpha=Math.random()*.1;
			} else if (shadeTime==false) {
				alphaCount=0;
				if (passCount==5) {
					if (i<50) {
						lineAlpha=Math.random()*.5;
						lineColor=0x000000;
					} else if (i>=50&&i<300) {
						lineAlpha=Math.random()*.25;
						lineColor=0x000000;
					} else if (i>=300&&i<500) {
						lineAlpha=Math.random()*.1;
						lineColor=0x000000;
					} else {
						lineAlpha=Math.random()*.025;
					}
				}
				shapeAlpha=Math.random()*.1;
			}
		}
		blendSkew=Math.ceil(Math.random()*1000);
		if (blendSkew==1000) {
			blendType="darken";
		} else if (blendSkew==9999) {
			blendType="lighten";
		} else {
			blendType="normal";
		}
		//assign the starting point as the ending point for the last line
		pointH4=pointH2=pointH3;
		pointW4=pointW2=pointW3;
		//calculate a random value for moveIt based on circleSize
		moveIt=Math.ceil(Math.random()*circleSize);
		//create a temp variable (0 or 1) to determine whether we add or subtract moveIt
		tempNumH=Math.floor(Math.random()*2);
		if (tempNumH==0) {
			pointH-=moveIt;
		} else if (tempNumH==1) {
			pointH+=moveIt;
		}
		//create another temp variable to determine the add or subtract routine
		tempNumW=Math.floor(Math.random()*2);
		//add or subtract based on temp
		if (tempNumW==0) {
			pointW-=moveIt;
		} else if (tempNumW==1) {
			pointW+=moveIt;
		}
		//calculate the values of moveIt2 and moveIt3
		moveIt2=Math.ceil(Math.random()*lineLength);
		moveIt4=Math.ceil(Math.random()*lineLength);
		moveIt3=Math.ceil(Math.random()*longLineLength);
		moveIt5=Math.ceil(Math.random()*longLineLength);
		//calculate the moveColor variable and assign color change
		moveColor=Math.random()*2;
		if (moveColor<1) {
			color--;
		} else if (moveColor>1) {
			color++;
		} else {
			color=color;
		}
		//declare two temp variables and assign a value of 0 or 1
		tempNumH2=Math.floor(Math.random()*2);
		tempNumW2=Math.floor(Math.random()*2);
		//add or subtract the moveIt values based on the temp variables
		if (tempNumH2==1) {
			pointH3+=moveIt2;
			pointH4+=moveIt3;
		} else if (tempNumH2==0) {
			pointH3-=moveIt2;
			pointH4-=moveIt3;
		}
		if (tempNumW2==1) {
			pointW3+=moveIt4;
			pointW4+=moveIt5;
		} else if (tempNumW2==0) {
			pointW3-=moveIt4;
			pointW4-=moveIt5;
		}
		setPoints();
		//make the circle size == moveIt so it never overlaps unless backtracking
		size=moveIt;
		if (drawOutcome==10000) {
			tempNum3=Math.ceil(Math.random()*5);
			if (tempNum3==1) {
				//draw the circle
				sprite.graphics.beginFill(color, shapeAlpha);
				sprite.graphics.drawCircle(pointW,pointH,size);
				sprite.graphics.endFill();
				//add the circle to the bitmap
				pixels.draw(sprite, null, colorTrans, blendType);
				//clear the objects from the sprite
				sprite.graphics.clear();
			} else if (tempNum3==2) {
				//draw the ellipse
				sprite.graphics.beginFill(color, shapeAlpha);
				sprite.graphics.drawEllipse(pointW,pointH,pointW2,pointH2);
				sprite.graphics.endFill();
				//add the circle to the bitmap
				pixels.draw(sprite, null, colorTrans, blendType);
				//clear the objects from the sprite
				sprite.graphics.clear();
			} else if (tempNum3==3) {
				//draw a rectangle
				sprite.graphics.beginFill(color, shapeAlpha);
				sprite.graphics.drawRect(pointW,pointH,pointW2,pointH2);
				sprite.graphics.endFill();
				//add the circle to the bitmap
				pixels.draw(sprite, null, colorTrans, blendType);
				//clear the objects from the sprite
				sprite.graphics.clear();
			} else if (tempNum3==4) {
				//draw a round rect
				sprite.graphics.beginFill(color, shapeAlpha);
				sprite.graphics.drawRoundRect(pointW,pointH,pointW2,pointH2,pointH4,pointH4);
				sprite.graphics.endFill();
				//add the circle to the bitmap
				pixels.draw(sprite, null, colorTrans, blendType);
				//clear the objects from the sprite
				sprite.graphics.clear();
			} else if (tempNum3==5) {
				//draw a triangle
				vertices.push(pointH, pointW);
				vertices.push(pointH2, pointW2);
				vertices.push(pointH4, pointW4);
				sprite.graphics.beginFill(color, shapeAlpha);
				sprite.graphics.drawTriangles(vertices);
				sprite.graphics.endFill();
				//add the circle to the bitmap
				pixels.draw(sprite, null, colorTrans, blendType);
				//clear the objects from the sprite
				sprite.graphics.clear();
			}
		} else if (drawOutcome>=9990) {
			//draw the long line
			sprite.graphics.moveTo(pointW2,pointH2);
			sprite.graphics.lineStyle(1, lineColor, lineAlpha);
			sprite.graphics.lineTo(pointW4,pointH4);
			//add the line to the bitmap
			pixels.draw(sprite, null, colorTrans, blendType);
			sprite.graphics.clear();
		} else {
			//draw the line
			sprite.graphics.moveTo(pointW2,pointH2);
			sprite.graphics.lineStyle(1, lineColor, lineAlpha);
			sprite.graphics.lineTo(pointW3,pointH3);
			//add the line to the bitmap
			pixels.draw(sprite, null, colorTrans, blendType);
			sprite.graphics.clear();
		}
	}
	redrawCount++;
	passCount++;
	drawCount.text="Total Redraws: "+redrawCount;
	trace("pointH = " + pointH + " pointW = " + pointW + " pointH2 = " + pointH2 + " pointW2 = " + pointW2 + " pointH3 = " + pointH3 + " pointW3 = " + pointW3 + " pointH4 = " + pointH4 + " pointW4 = " + pointW4); 
	/*
	pointW=Math.round(Math.random()*screen.width);
	pointH=Math.round(Math.random()*screen.height);
	pointW3=Math.round(Math.random()*screen.width);
	pointH3=Math.round(Math.random()*screen.height);
	pointW2=Math.round(Math.random()*screen.width);
	pointH2=Math.round(Math.random()*screen.height);
	pointW4=pointW3;
	pointH4=pointH3;
	*/

	//color=Math.random()*0xFFFFFF;
}

function setPoints():void {
	// if pointW goes off the stage, wrap it to the other side
	if (pointW<0) {
		pointW=Math.abs(pointW);
	} else if (pointW>screen.width) {
		pointW=screen.width-(pointW-screen.width);
	}
	//if pointH goes off the stage, wrap it to the other side
	if (pointH<0) {
		pointH=Math.abs(pointH);
	} else if (pointH>screen.height) {
		pointH=screen.height-(pointH-screen.height);
	}
	// if pointW3 or pointH3 go off the stage, restart them in a random position
	if (pointW2<0) {
		pointW2=Math.abs(pointW2);
	} else if (pointW2>screen.width) {
		pointW2=screen.width-(pointW2-screen.width);
	}
	if (pointH2<0) {
		pointH2=Math.abs(pointH2);
	} else if (pointH2>screen.height) {
		pointH2=screen.height-(pointH2-screen.height);
	}
	if (pointW3<0) {
		pointW3=Math.abs(pointW3);
	} else if (pointW3>screen.width) {
		pointW3=screen.width-(pointW3-screen.width);
	}
	if (pointH3<0) {
		pointH3=Math.abs(pointH3);
	} else if (pointH3>screen.height) {
		pointH3=screen.height-(pointH3-screen.height);
	}
	if (pointW4<0) {
		pointW4=Math.abs(pointW4);
	} else if (pointW4>screen.width) {
		pointW4=screen.width-(pointW4-screen.width);
	}
	if (pointH4<0) {
		pointH4=Math.abs(pointH4);
	} else if (pointH4>screen.height) {
		pointH4=screen.height-(pointH4-screen.height);
	}
}


function changeColor(event:TimerEvent):void {
	color=Math.random()*0xFFFFFF;
}

var myTimer:Timer=new Timer(1000,0);
myTimer.start();
myTimer.addEventListener(TimerEvent.TIMER, drawLine);

/*
var myTimer2:Timer=new Timer(20000,0);
myTimer2.start();
myTimer2.addEventListener(TimerEvent.TIMER, setPoints);

*/
var myTimer3:Timer=new Timer(300000,0);
myTimer3.start();
myTimer3.addEventListener(TimerEvent.TIMER, changeColor);
		}
	}
}


/*
pseudo code-

create a SWF of specified size
set a variable equal to the size of the canvas (WxH)
subtract 50 from the width and 150 from the height
create a bitmap with the remaining dimensions
set the bitmap's placement at 25x25
create a text field to hold the redraw count
set the text field at 25x100-from-the-bottom
create the stop and start buttons
place them at 100-from-the-bottom and spaced evenly inside the margin (125 from the right, and 250 from the right)
disable the start button, enable the stop button
start drawing! {
	generate four random sets of points as seeds, unless the function has run before
	if the points exceed the canvas, reset them to fit
	generate four random numbers for the outcome of different actions
}


*/
