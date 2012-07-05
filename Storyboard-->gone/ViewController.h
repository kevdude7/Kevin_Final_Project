//
//  ViewController.h
//  Martostheplant
//
//  Created by iD Student on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ViewController : UIViewController
{

    NSArray *images;
    int watercanCount;
    NSTimer*timer;
    bool water;
}

@property (weak, nonatomic) IBOutlet UIImageView *watercan;
@property (weak, nonatomic) IBOutlet UIImageView *plant;
@property (weak, nonatomic) IBOutlet UITextField *intersectCount;
- (IBAction)Button:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *Label;
- (IBAction)save:(id)sender;
- (IBAction)Load:(id)sender;



@end

