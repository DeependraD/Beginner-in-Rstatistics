
# This just a simple heart.
dat<- data.frame(t=seq(0, 2*pi, by=0.1) ) #by=0.1 is default, alter the window to a smaller value to get smoother plots.
xhrt <- function(t) 16*sin(t)^3
yhrt <- function(t) 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)
dat$y=yhrt(dat$t)
dat$x=xhrt(dat$t)
with(dat, plot(x,y, type="l"))
with(dat, polygon(x,y, col="hotpink"))
points(c(10,-10, -15, 15), c(-10, -10, 10, 10), pch=169, font=5)

# The built in characters including heart.
library(Cairo)
clubs <- expression(symbol('\247'))
hearts <- expression(symbol('\251'))
diamonds <- expression(symbol('\250'))
spades <- expression(symbol('\252'))
csymbols <- c(clubs, hearts, diamonds, spades)

plot( 0, xlim=c(0,5), ylim=c(0,2), type="n" )
clr <- c("black", "red", "red", "black") 
for (i in 1:4) {
  hline <- function( yloc, ... ) 
    for (i in 1:length(yloc)) 
      lines( c(-1,6), c(yloc[i],yloc[i]), col="gray")  
  hline(0.9); 
  hline(1.0);
  hline(1.1);
  hline(1.2)  
  text( i, 1, csymbols[i], col=clr[i], cex=5 )  
  text( i, 0.5, csymbols[i], col=clr[i] ) }

# Also try this
plot(1,1)
text(x=1+0.2*cos(seq(0, 2*pi, by=.5)), 
     y=1+0.2*sin(seq(0, 2*pi, by=.5)), 
     expression(symbol('\251') ) )

# Brick heart
plot(1, 1, pch = "♥", cex = 20, xlab = "", ylab = "", col = "firebrick3")

# Partitioned Heart
MASS::eqscplot(0:1,0:1,type="n",xlim=c(-1,1),ylim=c(-0.8,1.5))
curve(4/5*sqrt(1-x^2)+sqrt(abs(x)),from=-1,to=1,add=TRUE,col=2)
curve(4/5*-sqrt(1-x^2)+sqrt(abs(x)),from=-1,to=1,add=TRUE,col=2)

# ggHeart, gime-gimme your heart.
library(ggplot2)
dat <- data.frame(x=seq(0, 2*pi, length.out=1000))
cardioid <- function(x, a=1)a*(1-cos(x))
ggplot(dat, aes(x=x)) + stat_function(fun=cardioid) + coord_polar()

heart <- function(x)2-2*sin(x) + sin(x)*(sqrt(abs(cos(x))))/(sin(x)+1.4)
ggplot(dat, aes(x=x)) + stat_function(fun=heart) + coord_polar(start=-pi/2)

# ascii heart
xmin <- -5
xmax <- 10
n <- 1e3
xs<-seq(xmin,xmax,length=n)
ys<-seq(xmin,xmax,length=n)

f = function(x, y) (x^2+0.7*y^2-1)^3 - x^2*y^3
zs <- outer(xs,ys,FUN=f)

h <- contourLines(xs,ys,zs,levels=0)
library(txtplot)
with(h[[1]], txtplot(x, y))


# froggyheart is just a template function to generate a heart shape, still in its juvenile form.
froggyheart <- function(y, x) 
  {((y - (2((abs(x)) + x^2 - 6))/(3(abs(x) + x^2 + 2)))^2 + x^2)=36}

# Mantain caution. Adult content! http://stackoverflow.com/a/8084008/6725057
thong<-function(h = 9){ 
  # set up plot  
  xrange=c(-15,15)  
  yrange=c(0,16)  
  plot(0,xlim=xrange,ylim=yrange,type='n')  
  
  # draw outer envelope  
  yr=seq(yrange[1],yrange[2],len=50)  
  offsetFn=function(y){2*sin(0+y/3)}  
  offset=offsetFn(yr)  
  leftE = function(y){-10-offsetFn(y)}  
  rightE = function(y){10+offsetFn(y)}  
  
  xp=c(leftE(yr),rev(rightE(yr))) 
  yp=c(yr,rev(yr))  
  polygon(xp,yp,col="#ffeecc",border=NA) 
  
  # feasible region upper limit: 
  # left and right defined by triple-log function:  
  xt=seq(0,rightE(h),len=100)   
  yt=log(1+log(1+log(xt+1)))   
  yt=yt-min(yt)  
  yt=h*yt/max(yt)  
  x=c(leftE(h),rightE(h),rev(xt),-xt) 
  y=c(h,h,rev(yt),yt) 
  polygon(x,y,col="red",border=NA)  
}
