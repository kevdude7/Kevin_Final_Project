//
//  ViewController.m
//  Martostheplant
//
//  Created by iD Student on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize Label;
@synthesize intersectCount = _intersectCount;
@synthesize watercan = _watercan;
@synthesize plant = _plant;


- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *images = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"Plant 1.png"],
                       [UIImage imageNamed:@"Plant 2.png"],
                       [UIImage imageNamed:@"Plant 3.png"],
                       [UIImage imageNamed:@"Plant 4.png"],
                       nil];      
    _watercan.frame = CGRectMake (220,20, 50,50);
    _plant.frame = CGRectMake (98,200,125,192);
    
    water = TRUE;
        
}

- (void)viewDidUnload
{
    [self setWatercan:nil];
    [self setPlant:nil];
    [self setIntersectCount:nil];
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    

}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
   
    if (water == TRUE){ 
        UITouch *touch = [touches anyObject];
        CGPoint currentPoint = [touch locationInView:self.view];
        
        
        // [_watercan setUserInteractionEnabled:NO];
        
    
    // else{
    //   [_watercan setUserInteractionEnabled:YES];
    // }
    
    if (touch.view != self.view) {
        [touch view].center = currentPoint;
    }       
    
    [self intersect];
}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

}


-(void)intersect{ 
    if (water == FALSE){
        water = TRUE;
        Label.text = [NSString stringWithFormat:@"Water"];
    }
    
    
}

- (IBAction)Button:(id)sender {
   
    if (CGRectIntersectsRect(_watercan.frame,_plant.frame))
    {
        watercanCount = watercanCount +1;
        _watercan.frame = CGRectMake (220,20, 50,50);
        
    }
        _intersectCount.text = [NSString stringWithFormat:@"# of times watered: %i ", watercanCount];
    
    if (watercanCount == 4) {
        _plant.image  = [UIImage imageNamed:@"Plant 2.png"];
        
    }
    
    if (watercanCount == 8) {
        _plant.image  = [UIImage imageNamed:@"Plant 3.png"];
        
    }
    if (watercanCount == 12) {
        _plant.image  = [UIImage imageNamed:@"Plant 4.png"];
        
    }
    
    water = FALSE;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector (intersect) userInfo:nil repeats:NO];


}

-(void)Water { Label.text = [NSString stringWithFormat:@"Water"];

   
}





- (IBAction)save:(id)sender {
}
@end
