local Translations =
{
    error =
    {
        something_went_wrong = 'Algo deu errado!',
        you_dont_have_any_horse_to_sell = "Você não possui nenhum cavalo para vender!",
        owned_horse = 'Infelizmente, você não pode vender ou salvar seu próprio cavalo!',
        you_dont_have_any_horse_to_save = 'Você não está montado em um cavalo selvagem domado',
        not_tamed = 'Você só pode vender ou salvar um cavalo selvagem que você domou por si mesmo!'
    },
    success =
    {
        you_have_sold_all_your_horse_for = 'Você vendeu o cavalo por $',
    },
    primary =
    {
        var = 'o texto vai aqui',
    },
    menu =
    {
        open = 'Abrir ',
        sell_stored_horse = 'Vender um Cavalo Selvagem',
        save_stored_horse = 'Enviar um Cavalo Selvagem para o Estábulo',
        sellwildhorse_menu = 'Menu de Cavalos Selvagens',
        open_sellwildhorse_shop = 'Abrir Loja de Cavalos Selvagens',
        close_menu = 'Fechar Menu',
    },
    commands =
    {
        var = 'o texto vai aqui',
    },
    progressbar =
    {
        checking_horse = 'Verificando o Cavalo ',
    },
    text =
    {
        sell_store_horse = 'E veja o que eu te dou!',
        save_store_horse = 'Tenha sua sela de cavalo pronta!',
        sellwildhorse_shop = 'Loja de Venda de Cavalos Selvagens',
    }
}

if GetConvar('rsg_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
