//
//  MyApp.m
//  com.homing.alwayshome
//
//  Created by julong on 2017/5/30.
//  Copyright © 2017年 eillyer. All rights reserved.
//
#import "MyApp.h"
#import <objc/runtime.h>

id dynamicGetter(id self, SEL _cmd);

@interface MyApp ()
{
    @package
    id _applocationProxy;
}

@end

@implementation MyApp

@dynamic ODRDiskUsage, applicationIdentifier, applicationType, dynamicDiskUsage, isBetaApp, isInstalled, isNewsstandApp, isPlaceholder, isRestricted, isWatchKitApp, itemID, itemName, minimumSystemVersion, sdkVersion, shortVersionString, sourceAppIdentifier, staticDiskUsage, teamID, bundleIdentifier;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

#pragma mark - Life Cycle

- (instancetype)initWithAppProxy:(id)app {
    
    if (self = [super init]) {
        
        _applocationProxy = app;
    }
    
    return self;
}

#pragma mark - Dynamic Getter

+ (BOOL) resolveInstanceMethod:(SEL)aSEL {
    
    Class cls = NSClassFromString(@"LSApplicationProxy");
    id instance = [[cls alloc] init];
    
    
    if ([instance respondsToSelector:aSEL]) {
        class_addMethod([self class], aSEL, (IMP)dynamicGetter, "v@:f");
        return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}

#pragma mark - Public Methods
- (BOOL)isSystemOrInternalApp {
    
    return [_applocationProxy performSelector:NSSelectorFromString(@"isSystemOrInternalApp")];
}


- (NSString *)localizedName {
    
    return [_applocationProxy performSelector:NSSelectorFromString(@"localizedName")];
    
}

- (NSString *)bundleIdentifier{
    return [_applocationProxy performSelector:NSSelectorFromString(@"bundleIdentifier")];
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"name: %@\nversion:%@", [self localizedName],
            self.shortVersionString];
}

- (UIImage *)iconImage {
    
    NSData *iconData = [_applocationProxy performSelector:NSSelectorFromString(@"iconDataForVariant:") withObject:@(2)];
#pragma clang diagnostic pop
    
    NSInteger lenth = iconData.length;
    NSInteger width = 87;
    NSInteger height = 87;
    
    uint32_t *pixels = (uint32_t *)malloc(width * height * sizeof(uint32_t));
    [iconData getBytes:pixels range:NSMakeRange(32, lenth - 32)];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(pixels,
                                             width,
                                             height,
                                             8,
                                             (width + 1) * sizeof(uint32_t),
                                             colorSpace,
                                             kCGBitmapByteOrder32Little |
                                             kCGImageAlphaPremultipliedFirst);
    
    CGImageRef cgImage = CGBitmapContextCreateImage(ctx);
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    UIImage *icon = [UIImage imageWithCGImage: cgImage];
    CGImageRelease(cgImage);
    
    return icon;
}

- (NSString *)prettySizeString {
    
    NSArray *units = @[ @"B", @"KB", @"MB", @"GB"];
    double dsize = [self.staticDiskUsage doubleValue];
    NSString *unit = @"B";
    NSInteger i = 0;
    while (dsize >= 1024) {
        
        dsize /= 1024;
        ++i;
        unit = [units objectAtIndex: i];
    }
    
    return [NSString stringWithFormat:@"%.2f %@", dsize, unit];
}

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
id dynamicGetter(id self, SEL _cmd) {
    
    id app = ((MyApp *) self)->_applocationProxy;
    return [app performSelector:_cmd];
}

#pragma clang diagnostic pop
