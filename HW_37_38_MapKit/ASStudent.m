//
//  ASStudent.m
//  HW_37_38_MapKit
//
//  Created by MD on 11.07.15.
//  Copyright (c) 2015 MD. All rights reserved.
//

#import "ASStudent.h"
#import <MapKit/MapKit.h>
#import "UIImage+imageWithImage.h"

@implementation ASStudent


#define ARC4RANDOM_MAX      0x100000000


-(instancetype) initWithName:(NSString*)name andFamaly:(NSString*)famaly andMeetingPointLocation:(CLLocationCoordinate2D)pointCoordinate{

  self = [super init];
    
    if (self) {
        
        NSCalendar       *calendar  = [NSCalendar currentCalendar];
        NSDateComponents *comps     = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
  
        NSString         *stringOfBirth = [NSString stringWithFormat:@"%ld",[comps year]-((arc4random()%(60-18))+18)];

        self.firstname    = name;
        self.lastname     = famaly;
        self.dateOfBirth  = stringOfBirth;
        self.genderEnum   = rand()%2;
        
        
        if (self.genderEnum == ASMale) {
            self.genderString = @"Male";
            //self.image = [UIImage imageNamed:@"Army_officer-64.png"];
            self.image = [UIImage imageNamed:@"Army_officer-512.png"];

            self.image    = [UIImage imageWithImage:self.image scaledToSize:CGSizeMake(42, 42)];

        }
        else {
            self.genderString = @"Female";
           // self.image = [UIImage imageNamed:@"Themis-64.png"];
            self.image = [UIImage imageNamed:@"Themis-512.png"];

            self.image    = [UIImage imageWithImage:self.image scaledToSize:CGSizeMake(42, 42)];

        }
        
        
        
        // От координат пользователя будем выставлять студентов
        CLLocationCoordinate2D coordinateUser2d = pointCoordinate;
        
        double latitudeUser  = coordinateUser2d.latitude;
        double longitudeUser = coordinateUser2d.longitude;

        // Координаты студентов
        CLLocationCoordinate2D coordinateStudent2d;
        
        double latitudeStudent   =   latitudeUser  + [self randomFloatBetween:-0.015 andLargerFloat:0.015];
        double longitudeStudent  =   longitudeUser + [self randomFloatBetween:-0.015 andLargerFloat:0.015];
        
        coordinateStudent2d.latitude  = latitudeStudent;
        coordinateStudent2d.longitude = longitudeStudent;
        
        
        self.coordinate = coordinateStudent2d;
        self.title    = [NSString stringWithFormat:@"%@ %@",name,famaly];
        self.subtitle = [NSString stringWithFormat:@"%@",stringOfBirth];

        
        NSLog(@" latitudeStudent = %f   longitudeStudent = %f",latitudeStudent,longitudeStudent);
        //NSLog(@"\tName = %@     \tFamaly = %@     \tDate = %@  |",name,  famaly, string);
    }
    return self;
}

-(double)randomFloatBetween:(double)num1 andLargerFloat:(double)num2
{
    double range = num2 - num1;
    double val = ((double)arc4random() / ARC4RANDOM_MAX) * range + num1;
    
    return val;
}

@end
