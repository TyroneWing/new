//
//  Networks.h
//  EasyCommision
//
//  Created by yi on 17/5/17.
//  Copyright © 2017年 yi. All rights reserved.
//

#ifndef Networks_h
#define Networks_h

#define   kWIN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define   kWIN_HEIGHT [[UIScreen mainScreen] bounds].size.height

/**
 *  Color
 */
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define RedBackColor [UIColor colorWithRed:219/255.0 green:0/255.0 blue:17/255.0 alpha:1.0]
#define TextNomalColor [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1.0]


//公网host
#define URL_HEAD @"http://test.com"
//测试host
//#define URL_HEAD @"http://test.com"



#endif /* Networks_h */
