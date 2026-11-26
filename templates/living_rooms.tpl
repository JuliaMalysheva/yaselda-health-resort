<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{SITE}/style.css">
    <title>Проживание</title>
</head>
<body>
<header class="header-style" style="background-color: #FFF9EE;">
    <div class="img-logo">
        <a href="{SITE}/"><img src="{SITE}/sanat-images/logo.svg" style="height: 70px; width: 240px;"></a>
        <button class="burger-menu-open" id="burger-menu-butt">
            <img src="{SITE}/sanat-images/burger-menu-blue.svg">
        </button>
    </div>
    <nav class="menu-style font-unbounded-regular font-size16">
        <ul style="display: flex; flex-direction: row; justify-content: flex-end; gap: 35px; list-style: none;">
            {MENU}
        </ul>
    </nav>
    <div class="burger-menu-inside">
        <div class="burger-header">
            <img src="{SITE}/sanat-images/logo.svg" alt="Логотип">
            <button class="burger-menu-close">
                <img src="{SITE}/sanat-images/cross-blue.svg" style="height: 35px;">
            </button>
        </div>
        <ul class="burger font-unbounded-regular font-size18 color-dark">
            {MENU}
        </ul>
    </div>
</header>
<div class="block1doc-style">
    <div class="pagetitle-style">
        <h1 class="color-dark font-unbounded-semibold font-size80">{H1}</h1>
        <nav>
            {CRUMBS}
        </nav>
    </div>
    <div class="img-top" style="background-image: url('{SITE}/sanat-images/living_rooms/{BACKGROUND}');"></div>
</div>
<div class="block2livroom-style">
    <h2 class="color-dark font-unbounded-semibold font-size40">НОМЕРА</h2>
    <div class="livingrooms-style">
        {ROOM_CARDS}
    </div>
</div>

{LAST_BLOCK}
{FOOTER}
</body>
</html>