local Translations =
{
    error =
    {
        something_went_wrong = 'Something went wrong!',
        you_dont_have_any_horse_to_sell = "You don\'t have any horse to sell!",
        owned_horse = 'Unfortunately you can\'t sell your own horse!',
        not_tamed = 'You can only sell a wild horse you tamed by yourself!'
    },
    success =
    {
        you_have_sold_all_your_horse_for = 'You have sold the horse for $',
    },
    primary =
    {
        var = 'text goes here',
    },
    menu =
    {
        open = 'Open ',
        sell_stored_horse = 'Sell a Wild Horse',
        sellwildhorse_menu = 'Wild Horses Menu',
        open_sellwildhorse_shop = 'Open Wild Horses Shop',
        close_menu = 'Close Menu',
    },
    commands =
    {
        var = 'text goes here',
    },
    progressbar =
    {
        checking_horse = 'Checking Horse ',
    },
    text =
    {
        sell_store_horse = 'And see what I give you!',
        sellwildhorse_shop =  'Sell Wild Horses Shop',
    }
}

Lang = Locale:new(
{
    phrases = Translations,
    warnOnMissing = true
})