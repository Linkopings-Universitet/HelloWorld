//
//  ViewController.h
//  HelloWorld
//
//  Created by Alek Åström LiU on 2012-01-17.
//  Edited by Cenny Davidsson 2014-01-15.
//  Copyright (c) 2012 Linköpings University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (weak, nonatomic) IBOutlet UILabel *shakeLabel;

// NSUinterger är inte ett object och behöver inte en strong eller weak reference
@property (nonatomic) NSUInteger shakeCount;


@end
