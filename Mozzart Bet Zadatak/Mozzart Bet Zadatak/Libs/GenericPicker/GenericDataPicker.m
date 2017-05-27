//
//  GenericDataPicker.m
//

#import "GenericDataPicker.h"

@interface GenericDataPicker ()

@property (copy, nonatomic) completionHandlerDate compBlock;

@end

@implementation GenericDataPicker

// Constructor
- (id)initWithCurrentDate:(NSDate *)currentDate minimumDate:(NSDate *)minimumDate andCompletionHandler:(completionHandlerDate)completion {
	if (self = [super init]) {
		
		// Configure data picker
		_datePicker = [UIDatePicker new];
		_datePicker.datePickerMode = UIDatePickerModeDate;
//		_datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_AU"];
		if (minimumDate) {
			_datePicker.minimumDate = minimumDate;
		}
		if (currentDate) {
			_datePicker.date = currentDate;
		}
		[_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
		
		_compBlock = completion;
	}
	return self;
}

// Execute date changing on picker
- (void)dateChanged:(id)sender {
	self.compBlock(_datePicker.date);
}

@end
