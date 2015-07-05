//
//  ViewController.m
//  HelloWorld
//
//  Created by Alek Åström LiU on 2012-01-17.
//  Edited by Cenny Davidsson 2014-01-15.
//  Copyright (c) 2012 Linköpings University. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

// Här declarerar vi privata properties
@interface ViewController ()

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (weak, nonatomic) IBOutlet UILabel *shakeLabel;

// NSUinterger är inte ett object och behöver inte en strong eller weak reference
@property (nonatomic) NSUInteger shakeCount;

@end

// Här börjar implementationen av våran klass
@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Hitta den exakta sökvägen till vår ljudfil aaa.wav
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"aaa" withExtension:@"wav"];
    
    // Skapa en ljudspelare som ska spela upp ljudet
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    // Förbered för att spela
    [self.audioPlayer prepareToPlay];
    
    // Initialisera vår räknarvariabel.  Denna ska hålla räkningen på hur många gånger
    // användaren skakat skärmen
    self.shakeCount = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Gör så denna vy svarar på events
    [self becomeFirstResponder];
}

#pragma mark - UIResponder

- (BOOL)canBecomeFirstResponder {
    return YES;
}

#pragma mark - UIResponder - Motion event handling

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    // Kollar att rörelsen var en skakning
    if (event.type == UIEventSubtypeMotionShake) {
        // Skriv ut debug-skrift till loggen
        NSLog(@"Skak!");
        
        // Spela upp ljudet
        [self playSound];
        
        // Öka skakräknaren
        self.shakeCount++;
        
        // Uppdatera texten som visas på skärmen
        self.shakeLabel.text = [NSString stringWithFormat:@"Du har skakat på skärmen %lu gånger", (unsigned long)self.shakeCount];
    }
}

#pragma mark - User interaction

- (void)playSound {
    // Kolla om ljudet redan spelas
    if ([self.audioPlayer isPlaying]) {
        
        // Stoppa det då och sätt spelaren till att börja från början
        // av ljudfilen nästa gång den spelas
        [self.audioPlayer stop];
        self.audioPlayer.currentTime = 0;
    }
    
    // Spela ljudet!
    [self.audioPlayer play];
}


@end
