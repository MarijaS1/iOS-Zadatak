//
//  GenericPicker.m
//

#import "GenericPicker.h"

@interface GenericPicker ()

@property (nonatomic, strong) NSArray *data;

// Sinle row
@property (nonatomic, copy) completionHandlerSinglePicker compBlock;

// Multiple rows
@property (nonatomic, strong) NSMutableArray *selectedData;
//@property (nonatomic) NSInteger numberOfComponents;
@property (nonatomic, strong) NSMutableArray *selectedRows;
@property (nonatomic, strong) NSMutableArray *selectedRowsInColumns;
@property (nonatomic, copy) completionHandlerMultiplePicker compBlockMultiple;

@end

@implementation GenericPicker

- (void)initData:(NSArray *)pickerData {
    self.picker = [UIPickerView new];
    self.picker.delegate = self;
    self.picker.dataSource = self;
    self.data = pickerData;
}

- (instancetype)initWithSingleRow:(NSArray *)pickerData andCompletionHandler:(completionHandlerSinglePicker)completion {
    if (self = [super init]) {
        self.compBlock = completion;
        [self initData:pickerData];
    }
    return self;
}

- (instancetype)initWithMultipleRows:(NSArray *)pickerMultipleData andCompletionHandler:(completionHandlerMultiplePicker)completion {
    if (self = [super init]) {
        
        self.compBlockMultiple = completion;
        self.selectedRows = [NSMutableArray array];
        self.selectedData = [NSMutableArray array];
        
        for (int i = 0; i < [pickerMultipleData count]; i++) {
            [self.selectedRows addObject:@(0)];
            [self.selectedData addObject:@""];
        }
        
        [self initData:pickerMultipleData];
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if ([[self.data firstObject] isKindOfClass:[NSArray class]]) {
        return [self.data count];
    } else {
        return 1;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if ([self.data[component] isKindOfClass:[NSArray class]]) {
        return [self.data[component] count];
    } else {
        return [self.data count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if ([self.data[component] isKindOfClass:[NSArray class]]) {
        return self.data[component][row];
    } else {
        return self.data[row];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 44.0f;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *retval = (id)view;
    if (!retval) {
        retval = [[UILabel alloc] initWithFrame:CGRectMake(8.0f, 0.0f, [pickerView rowSizeForComponent:component].width - 16.0f, [pickerView rowSizeForComponent:component].height)];
    }
    
    if ([self.data[component] isKindOfClass:[NSArray class]]) {
        retval.text = self.data[component][row];
    } else {
        retval.text = self.data[row];
    }
    
    retval.font = [UIFont systemFontOfSize:16];
    retval.textAlignment = NSTextAlignmentCenter;
    
    return retval;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if ([self.data[component] isKindOfClass:[NSArray class]]) {
        
        // Configure selected rows
        [self.selectedRows replaceObjectAtIndex:component withObject:@(row)];
        
        // Configure returnable data
        int column = 0;
        for (NSNumber *index in self.selectedRows) {
            [self.selectedData replaceObjectAtIndex:column withObject:self.data[column][[index intValue]]];
            column++;
        }
        
        // Call proper block (closure)
        self.compBlockMultiple(self.selectedData, self.selectedRows);
        
    } else {
        self.compBlock(self.data[row], row);
    }
}

@end
