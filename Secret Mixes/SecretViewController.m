//
//  SecretViewController.m
//  Secret Mixes
//
//  Created by Michael Cornell on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecretViewController.h"
#import <AVFoundation/AVAudioPlayer.h>

@implementation SecretViewController
@synthesize player;
@synthesize track;
@synthesize path;

-(IBAction)playSound {
       [player play];
    NSLog(@"play");
}

-(IBAction)nextButton{
    [player stop];
    if(track==@"1"){track=@"2";}
  else if(track==@"2"){track=@"3";}
  else if(track==@"3"){track=@"4";}
  else if(track==@"4"){track=@"5";}
   else if(track==@"5"){track=@"1";}
    
   if(track==@"2") self.path=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/buscando.mp3", [[NSBundle mainBundle] resourcePath]]];
   else if(track==@"3") self.path=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/harmony.mp3", [[NSBundle mainBundle] resourcePath]]];
   else if(track==@"4") self.path=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/ithoughtiknew.mp3", [[NSBundle mainBundle] resourcePath]]];
   else if(track==@"5") self.path=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/liftthatlatch.mp3", [[NSBundle mainBundle] resourcePath]]];
   else self.path=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bigtoe.mp3", [[NSBundle mainBundle] resourcePath]]];

    NSError *error;           
    AVAudioPlayer* newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:path error:&error];
    player = newPlayer;
    [player setDelegate:self];
    [player play];
    NSLog(track);
}
-(IBAction)prevButton{
    [player stop];
    if(track==@"1"){track=@"5";}
   else if(track==@"2"){track=@"1";}
   else if(track==@"3"){track=@"2";}
   else if(track==@"4"){track=@"3";}
   else if(track==@"5"){track=@"4";}  
    
    if(track==@"2") self.path=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/buscando.mp3", [[NSBundle mainBundle] resourcePath]]];
    else if(track==@"3") self.path=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/harmony.mp3", [[NSBundle mainBundle] resourcePath]]];
    else if(track==@"4") self.path=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/ithoughtiknew.mp3", [[NSBundle mainBundle] resourcePath]]];
    else if(track==@"5") self.path=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/liftthatlatch.mp3", [[NSBundle mainBundle] resourcePath]]];
    else path=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bigtoe.mp3", [[NSBundle mainBundle] resourcePath]]];

    NSError *error;           
    AVAudioPlayer* newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:path error:&error];
    player = newPlayer;
    [player setDelegate: self];
    [player play];
    NSLog(track);

}
-(IBAction)pauseSound{
    [player pause];
    NSLog(@"pause");
    
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)playedSuccessfully {
    self.player = nil;
}

-(void)viewDidLoad{
   track=@"1";
    path = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bigtoe.mp3", [[NSBundle mainBundle] resourcePath]]];
    NSError *error;           
    AVAudioPlayer* newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:path error:&error];
    self.player = newPlayer;
    [player setDelegate:self];
    [player prepareToPlay];
    [player play];
    NSLog(@"program launch!");

}
@end

