local options= require('banana.config').options

local variants= {
    main ={
        bg = '#232958',
        cyan= '#84d2d9',
        blue = '#5ac0ff',
        pink= '#d272d2',
        lpink= '#ffaeff',
        purple= '#7685eb',
        lgreen= '#1fb44a',
        green ='#3ed949',
        yellow ='#ffec1e',
        banana= '#dfe88b',
        golden= '#bfc90d',
        grey= '#b9a6a7',
        red= '#ff4545',
        dblue= '#3896d1',
        magenta= '#c54dd0',
        white= '#f1f1f1',
        none= 'NONE'
    }
}


if options.variant == 'main' then
    return variants.main
end
