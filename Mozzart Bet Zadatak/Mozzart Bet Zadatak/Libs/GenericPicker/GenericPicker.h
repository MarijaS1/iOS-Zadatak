//
//  GenericPicker.h
//

#import <Foundation/Foundation.h>

typedef void(^completionHandlerSinglePicker) (NSString *selectedString, NSInteger selectedRow);
typedef void(^completionHandlerMultiplePicker) (NSArray *selectedStrings, NSArray *selectedRow);

@interface GenericPicker : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong,nonatomic) UIPickerView *picker;

- (instancetype)initWithSingleRow:(NSArray *)pickerData andCompletionHandler:(completionHandlerSinglePicker)completion;
- (instancetype)initWithMultipleRows:(NSArray *)pickerData andCompletionHandler:(completionHandlerMultiplePicker)completion;

@end
