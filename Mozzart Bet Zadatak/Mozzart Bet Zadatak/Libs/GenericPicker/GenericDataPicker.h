//
//  GenericDataPicker.h
//

#import <Foundation/Foundation.h>

typedef void(^completionHandlerDate) (NSDate *selectedDate);

@interface GenericDataPicker : NSObject

@property (strong,nonatomic) UIDatePicker *datePicker;

- (instancetype)initWithCurrentDate:(NSDate *)currentDate minimumDate:(NSDate *)minimumDate andCompletionHandler:(completionHandlerDate)completion;

@end
