local Translations = {
    error = {
        something_went_wrong = 'something went wrong!',
        you_dont_have_any_horse_to_sell = "you don\'t have any horse to sell!",
        dont_have_animal = "don't have an animal on you"
    },
    success = {
        you_have_sold_all_your_horse_for = 'you have sold your horse for $',
    },
    primary = {
        var = 'text goes here',
    },
    menu = {
        open = 'Open ',
        sell_stored_horse = 'Sell A Wild horse',
        sellwildhorse_menu = 'Wild Horses Menu',
        open_sellwildhorse_shop = 'Open Wild Horses Shop',
        close_menu = 'Close Menu',
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        checking_horse = 'Checking horse ',
    },
    text = {
        sell_store_horse = 'And see what i give you!',
        sellwildhorse_shop =  'Sell Wild Horses Shop',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
