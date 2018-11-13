//
//  MyAnnotation.h
//  APP
//
//  Created by eillyer on 2017/11/17.
//  Copyright © 2017年 eillyer. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject<MKAnnotation>
/**
 *  大头针的位置
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
/**
 *  大头针标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  大头针的子标题
 */
@property (nonatomic, copy) NSString *subtitle;
@end  
