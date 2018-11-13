//
//  MyAnnotationCell.m
//  APP
//
//  Created by eillyer on 2017/11/17.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "MyAnnotationCell.h"

@implementation MyAnnotationCell

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Set the frame size to the appropriate values.
        CGRect  myFrame = self.frame;
        myFrame.size.width = 20;
        myFrame.size.height = 20;
        self.frame = myFrame;
        [self setR:10 wid:2 color:[UIColor whiteColor]];
        
        // The opaque property is YES by default. Setting it to
        // NO allows map content to show through any unrendered parts of your view.
//        self.opaque = NO;
//        self.canShowCallout = NO;

        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:YES];
    
    
    
    // Get the custom callout view.
//    UIView *calloutView = self.calloutViewController.view;
//    if (selected) {
//        self.calloutViewController.maintitle.text = self.myCustomAnnotation.maintitle;
//        self.calloutViewController.secondtitle.text = self.myCustomAnnotation.secondtitle;
//
//        CGRect annotationViewBounds = self.bounds;
//        CGRect calloutViewFrame = calloutView.frame;
//        if (calloutViewFrame.origin.x==annotationViewBounds.origin.x) {
//            // Center the callout view above and to the right of the annotation view.
//            calloutViewFrame.origin.x  -= (calloutViewFrame.size.width - annotationViewBounds.size.width) * 0.5;
//            calloutViewFrame.origin.y -= (calloutViewFrame.size.height);
//            calloutView.frame = calloutViewFrame;
//        }
//
//        [self addSubview:calloutView];
//    } else {
//        [calloutView removeFromSuperview];
//    }
}

@end
