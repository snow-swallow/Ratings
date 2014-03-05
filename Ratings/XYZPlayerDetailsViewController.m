//
//  XYZPlayerDetailsViewController.m
//  Ratings
//
//  Created by timelyxyz on 14-2-21.
//
//

#import "XYZPlayerDetailsViewController.h"
#import "XYZPlayer.h"

@interface XYZPlayerDetailsViewController ()

@end

@implementation XYZPlayerDetailsViewController
{
    NSString *_game;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id) initWithCoder:(NSCoder *)aDecoder
{
    if((self = [super initWithCoder:aDecoder])){
        NSLog(@"init XYZPlayerDetailsViewController");
        _game = @"Chess";
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailLabel.text = _game;
}
- (void)dealloc{
    NSLog(@"dealloc XYZPlayerDetailsViewController");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){// 选中第一个section就默认textField的focus状态
        [self.nameTextField becomeFirstResponder];
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"PickGame"]){
        XYZGamePickerViewController *gamePickerViewController = segue.destinationViewController;
        gamePickerViewController.delegate = self;
        gamePickerViewController.game = _game;
    }
}
-(void) gamePickerViewController:(XYZGamePickerViewController *)controller didSelectGame:(NSString *)game
{
    _game = game;
    self.detailLabel.text = _game;
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)cancel:(id)sender{
    [self.delegate playerDetailsViewControllerDidCancel:self];
}
-(IBAction)done:(id)sender{
    XYZPlayer  *player = [[XYZPlayer alloc]init];
    player.name = self.nameTextField.text;
    player.game = _game;
    player.rating = 1;
    
    [self.delegate playerDetailsViewController:self didAddPlayer:player];
//    [self.delegate playerDetailsViewControllerDidSave:self];
}

@end
