//
//  BitcoinforNCViewControllerNew.m
//  Bitcoin for NC
//
//  Created by GokuLabs on 02.01.2014.
//  Copyright (c) 2014 GokuLabs. All rights reserved.
//

#import "BitcoinforNCViewControllerNew.h"
#import "BitcoinforNCView.h"

#define selfView ((BitcoinforNCView *)self.view)

@interface BitcoinforNCViewControllerNew ()

@property (nonatomic, strong) NSBundle *bundle;

@end


@implementation BitcoinforNCViewControllerNew

- (instancetype)init {
    self = [super init];

	if (self) {
        self.bundle = [NSBundle bundleForClass:[self class]];
	}
	return self;
}

- (void)loadView {
    self.view = [[BitcoinforNCView alloc] initWithFrame:(CGRect){CGPointZero, self.preferredViewSize}];
}

- (CGSize)preferredViewSize {
	return CGSizeMake(320.0f, 110.0f);
}
-(IBAction)refreshData:(id)sender {
	NSString *thePath = @"/var/mobile/Library/Preferences/com.gokulabs.bitcoinncprefs.plist";
	NSDictionary *Prefs = [[NSDictionary alloc] initWithContentsOfFile:thePath];
    NSError *error;
    NSData *jsonData;
    // i fucking hated this
    if ([Prefs[@"currency"] isEqual:@"USD"])
    {
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCUSD/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"GBP"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCGBP/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"AUD"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCAUD/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"CAD"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCCAD/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"CHF"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCCHF/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"CNY"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCCNY/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"DKK"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCDKK/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"EUR"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCEUR/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"HKD"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCHKD/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"JPY"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCJPY/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"NZD"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCNZD/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"PLN"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCPLN/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"RUB"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCRUB/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"SEK"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCSEK/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"SGD"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCSGD/money/ticker"]];
    }else if ([Prefs[@"currency"] isEqual:@"THB"]){
        jsonData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://data.mtgox.com/api/2/BTCTHB/money/ticker"]];
    }
    json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    //NSLog(@"%@",[json[@"return"] objectForKey:@"high"]);
    if (error)
    {
        highLabel.text = @"";
        buyLabel.text = @"Error fetching data";
        lowLabel.text = @"";
    }else {
    	highLabel.text = [NSString stringWithFormat:@"High: %@",[[json[@"data"] objectForKey:@"high"] objectForKey:@"display"]];
        buyLabel.text = [NSString stringWithFormat:@"Buy: %@",[[json[@"data"] objectForKey:@"buy"] objectForKey:@"display"]];
        lowLabel.text = [NSString stringWithFormat:@"Low: %@",[[json[@"data"] objectForKey:@"low"] objectForKey:@"display"]];
    }
    //NSLog(@"Refreshing... Error %@ : JSON: %@", error, json[@"result"]);
    json = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];


    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(refreshData:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer: singleTap];
    //high stat
    highLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 320, 70)];
    highLabel.text = @"";
    highLabel.textColor = [UIColor whiteColor];
    highLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
    [self.view addSubview:highLabel];
    //current ask/buy
    buyLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, 320, 70)];
    buyLabel.text = @"Fetching Data";
    buyLabel.textColor = [UIColor whiteColor];
    buyLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
    [self.view addSubview:buyLabel];
    //low stat
    lowLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 60, 320, 70)];
    lowLabel.text = @"";
    lowLabel.textColor = [UIColor whiteColor];
    lowLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
    [self.view addSubview:lowLabel];
    lowLabel.textAlignment = NSTextAlignmentCenter;
        buyLabel.textAlignment = NSTextAlignmentCenter;
        highLabel.textAlignment = NSTextAlignmentCenter;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshData:nil];
}
- (void)hostDidDismiss {
    [super hostDidDismiss];
	//Notification Center was closed
}

- (void)hostDidPresent {
	[super hostDidPresent];
	//Notification Center was opened
}

@end
