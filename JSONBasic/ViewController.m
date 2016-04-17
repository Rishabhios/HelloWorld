//
//  ViewController.m
//  JSONBasic
//
//  Created by Rishabh Gupta on 09/02/16.
//  Copyright © 2016 Rishabh Gupta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *arr;
    //NSMutableArray *arr1;

    
    
    
    int i;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    arr = [[NSMutableArray alloc]init];

    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url =[[NSURL alloc]initWithString:@"https://itunes.apple.com/lookup?id=211192863&entity=song&sort=popular"];
    NSData *data =[[NSData alloc]initWithContentsOfURL:url];
    NSDictionary *dictionary =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];//parse in human readable form.
    
    NSArray *rslt=[dictionary objectForKey:@"results"];//it will store the values of results say 0 1 2 3 4 ...12,which are object for key "result".
    NSLog(@"%@",rslt);
    for (i=0; i<rslt.count; i++) {
        
          artistDetail *obj = [[artistDetail alloc]init];
        
        NSDictionary *data1 =[rslt objectAtIndex:i];//moves at the index of values of results 0 1 2 3

        
        obj.artistName1=[data1 objectForKey:@"artistName"];
        obj.country1=[data1 objectForKey:@"country"];
        obj.wrapperType1=[data1 objectForKey:@"wrapper"];

        
        

        [arr addObject:obj];
        
        
        
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose  of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    artistDetail *t = [arr objectAtIndex:indexPath.row];
    
    cell.textLabel.text = t.artistName1;
    cell.detailTextLabel.text=t.country1;
    
    return cell;
    
}


@end
