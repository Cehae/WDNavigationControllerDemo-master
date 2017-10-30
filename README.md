# WDNavigationControllerDemo-master
模仿斗鱼AppiOS版自定义转场动画特效+全局侧滑pop手势

这几天突然对斗鱼AppiOS版转场动画的特效比较感兴趣，查询了好多关于自定义转场动画的资料终于将斗鱼App的转场效果模仿了出来，并且支持全局侧滑pop手势，同时导航栏也可以随手势滑动。不过还有几个bug，比如如果是rootViewController是UITabBarController的话，那么在pop到UITabBarController的时候，因为TabBar的原因，效果会很差。随后我会修改这个BUG，现在有思路的小伙伴也请Issues我。其中**WDTransitioning**文件夹是自定义转场动画的核心代码，好了废话不多说，[Demo传送门](https://github.com/Cehae/WDNavigationControllerDemo-master)，[博客传送门](http://blog.csdn.net/Cehae/article/details/78393916)。

Demo效果（由于网站限制，GIF图片的效果比较差，感兴趣的同学可以下载下来真机运行）:

![效果1](http://img.blog.csdn.net/20171030155041280?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQ2VoYWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

![效果2](http://img.blog.csdn.net/20171030155108690?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQ2VoYWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
