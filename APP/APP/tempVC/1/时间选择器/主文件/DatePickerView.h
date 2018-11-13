





#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height




typedef void(^ConfirmBlock)(NSString *choseDate,NSString *restDate);
typedef void(^CannelBlock)();

@interface DatePickerView : UIView

@property (nonatomic,strong) UIDatePicker *datePicker;

@property (nonatomic,copy) ConfirmBlock confirmBlock;

@property (nonatomic,copy) CannelBlock cannelBlock;

- (DatePickerView *)initWithCustomeHeight:(CGFloat)height;


@end
