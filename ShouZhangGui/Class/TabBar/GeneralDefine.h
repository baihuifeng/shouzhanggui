//
//  GeneralDefine.h
//
//

#ifndef GeneralDefine_h
#define GeneralDefine_h



#define NSLog(format, ...) do {                                             \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "-------\n");                                               \
} while (0)

#pragma mark - 尺寸所有宏

#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
//tabbar的高度
#define kTabBarHeigth 49
// 导航栏高度
#define kNavigationHeight 64

#define JYSetFont [UIFont systemFontOfSize:14]

#define WeakSelf __weak typeof(self) weakSelf = self;

//iphone6屏幕比例
#define KWidth_Scale    [UIScreen mainScreen].bounds.size.width/375.0f
//#define KHeight_Scale  [UIScreen mainScreen].bounds.size.height/667.0f



//****************设置颜色
#define UICOLOR_RGB_Alpha(_color,_alpha) [UIColor colorWithRed:((_color>>16)&0xff)/255.0f green:((_color>>8)&0xff)/255.0f blue:(_color&0xff)/255.0f alpha:_alpha]
// 所有控制器的背景颜色
#define JYControllerBackColor UICOLOR_RGB_Alpha(0xf3f2e6, 1)
//主题的颜色
#define KThemeColor UICOLOR_RGB_Alpha(0x1b7fd9, 1)
//按钮选中状态
#define KButtonSelectColor UICOLOR_RGB_Alpha(0x2ebc78, 1)
//按钮禁止状态
#define KButtonDisColor UICOLOR_RGB_Alpha(0xdddddd, 1)

//登录边框的颜色
#define KBorderColor UICOLOR_RGB_Alpha(0xd3d3d3, 1)
//文字基本颜色
#define KTextColor UICOLOR_RGB_Alpha(0x333333, 1)



//textFiledplaceholder 文字颜色
#define KplaceholderLabelColor UICOLOR_RGB_Alpha(0xcccccc, 1)

#define RGB(r, g, b) \
[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define RGBA(r, g, b, a) \
[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//****************设置颜色


////获取版本号
#define JYAppVersion [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]


#define JYRootTabBarController [UIApplication sharedApplication].keyWindow.rootViewController

//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

/// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

///  View加边框
#define ViewBorder(View, BorderColor, BorderWidth )\
\
View.layer.borderColor = BorderColor.CGColor;\
View.layer.borderWidth = BorderWidth;

//获取系统版本
#define XZSystemVersion ([UIDevice currentDevice].systemVersion.floatValue)
#define iOS9            (XZSystemVersion >= 9.0)
#define iOS8            (XZSystemVersion >= 8.0)
#define iOS7            (XZSystemVersion >= 7.0)
#define iOS6            (XZSystemVersion <  7.0)


/**
 单例宏定义，可用可不用
 */
// .h文件
#define HHSingletonH(name) + (instancetype)shared##name;

// .m文件
#define HHSingletonM(name) \
static id _instance = nil; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}



#endif /* GeneralDefine_h */
